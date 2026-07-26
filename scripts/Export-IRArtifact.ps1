<#
.SYNOPSIS
Collects a bounded set of Windows incident-response artifacts.

.DESCRIPTION
Exports process, service, network, system, and optional event-log artifacts to
a new local directory, then produces a SHA-256 manifest. The script does not
collect browser data, credentials, registry hives, memory, or user documents.

.PARAMETER OutputPath
New directory that will hold the collection.

.PARAMETER Hours
Number of hours represented in the exported event-log query.

.PARAMETER IncludeSecurityLog
Includes a bounded Windows Security event-log export. Reading this log usually
requires an elevated session.

.EXAMPLE
.\Export-IRArtifact.ps1 -OutputPath C:\IR\Case-001 -Hours 24 `
    -IncludeSecurityLog -WhatIf

.NOTES
Use only on systems you own or are authorized to investigate. Collected
artifacts may contain sensitive system and identity information.
#>
[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$OutputPath,

    [ValidateRange(1, 168)]
    [int]$Hours = 24,

    [switch]$IncludeSecurityLog
)

if (Test-Path -LiteralPath $OutputPath) {
    throw "OutputPath already exists: $OutputPath"
}

if (-not $PSCmdlet.ShouldProcess($OutputPath, 'Create incident-response artifact collection')) {
    return
}

$null = New-Item -ItemType Directory -Path $OutputPath -ErrorAction Stop

try {
    Get-CimInstance Win32_OperatingSystem |
        Select-Object CSName, Caption, Version, BuildNumber, LastBootUpTime |
        Export-Csv -LiteralPath (Join-Path $OutputPath 'system.csv') -NoTypeInformation

    Get-CimInstance Win32_Process |
        Select-Object ProcessId, ParentProcessId, Name, ExecutablePath, CommandLine |
        Export-Csv -LiteralPath (Join-Path $OutputPath 'processes.csv') -NoTypeInformation

    Get-CimInstance Win32_Service |
        Select-Object Name, State, StartMode, StartName, PathName |
        Export-Csv -LiteralPath (Join-Path $OutputPath 'services.csv') -NoTypeInformation

    Get-NetTCPConnection -ErrorAction SilentlyContinue |
        Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess |
        Export-Csv -LiteralPath (Join-Path $OutputPath 'tcp-connections.csv') -NoTypeInformation

    $start = (Get-Date).AddHours(-$Hours)
    Get-WinEvent -FilterHashtable @{ LogName = 'System'; StartTime = $start } -ErrorAction Stop |
        Export-Clixml -LiteralPath (Join-Path $OutputPath 'system-events.xml')

    if ($IncludeSecurityLog) {
        Get-WinEvent -FilterHashtable @{ LogName = 'Security'; StartTime = $start } -ErrorAction Stop |
            Export-Clixml -LiteralPath (Join-Path $OutputPath 'security-events.xml')
    }

    Get-ChildItem -LiteralPath $OutputPath -File |
        Get-FileHash -Algorithm SHA256 |
        Select-Object Algorithm, Hash, Path |
        Export-Csv -LiteralPath (Join-Path $OutputPath 'sha256-manifest.csv') -NoTypeInformation

    [pscustomobject]@{
        OutputPath  = (Resolve-Path -LiteralPath $OutputPath).Path
        CollectedAt = (Get-Date).ToUniversalTime()
        Hours       = $Hours
        FileCount   = (Get-ChildItem -LiteralPath $OutputPath -File).Count
    }
}
catch {
    throw "Artifact collection failed: $($_.Exception.Message)"
}
