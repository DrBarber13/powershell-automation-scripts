<#
.SYNOPSIS
Creates disabled fictional Active Directory lab users from a CSV file.

.DESCRIPTION
Validates a sanitized CSV and creates disabled accounts in an explicitly
provided OU. The script supports -WhatIf and never embeds or generates a
password. Enabling accounts is intentionally a separate administrative step.

.PARAMETER CsvPath
Path to a CSV containing SamAccountName, GivenName, Surname, and Department.

.PARAMETER Path
Distinguished name of the destination OU.

.EXAMPLE
.\New-LabUsers.ps1 -CsvPath .\fictional-lab-users.csv `
    -Path "OU=Policy Test,DC=corp,DC=example" -WhatIf

.NOTES
Requires the ActiveDirectory module and delegated permission to create users
in the target OU. Use only in an authorized lab.
#>
[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
param(
    [Parameter(Mandatory)]
    [ValidateScript({ Test-Path -LiteralPath $_ -PathType Leaf })]
    [string]$CsvPath,

    [Parameter(Mandatory)]
    [ValidatePattern('^OU=.+,DC=.+')]
    [string]$Path
)

Import-Module ActiveDirectory -ErrorAction Stop

$requiredColumns = @('SamAccountName', 'GivenName', 'Surname', 'Department')
$rows = @(Import-Csv -LiteralPath $CsvPath -ErrorAction Stop)

if ($rows.Count -eq 0) {
    throw 'The CSV contains no user records.'
}

$actualColumns = @($rows[0].PSObject.Properties.Name)
$missingColumns = @($requiredColumns | Where-Object { $_ -notin $actualColumns })

if ($missingColumns.Count -gt 0) {
    throw "Missing required CSV columns: $($missingColumns -join ', ')"
}

foreach ($row in $rows) {
    $sam = [string]$row.SamAccountName

    if ($sam -notmatch '^[a-z][a-z0-9._-]{2,19}$') {
        Write-Error "Skipping invalid SamAccountName: '$sam'."
        continue
    }

    if ([string]::IsNullOrWhiteSpace($row.GivenName) -or
        [string]::IsNullOrWhiteSpace($row.Surname)) {
        Write-Error "Skipping '$sam' because the name is incomplete."
        continue
    }

    $existing = Get-ADUser -Filter "SamAccountName -eq '$sam'" -ErrorAction Stop
    if ($existing) {
        Write-Warning "Skipping '$sam' because the account already exists."
        continue
    }

    $displayName = "$($row.GivenName) $($row.Surname)"
    if ($PSCmdlet.ShouldProcess($sam, "Create disabled lab user in $Path")) {
        New-ADUser `
            -SamAccountName $sam `
            -Name $displayName `
            -DisplayName $displayName `
            -GivenName $row.GivenName `
            -Surname $row.Surname `
            -Department $row.Department `
            -Path $Path `
            -Enabled $false `
            -ChangePasswordAtLogon $true `
            -ErrorAction Stop

        [pscustomobject]@{
            SamAccountName = $sam
            DisplayName    = $displayName
            Department     = $row.Department
            Path           = $Path
            Enabled        = $false
        }
    }
}
