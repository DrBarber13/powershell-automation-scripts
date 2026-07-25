<#
.SYNOPSIS
Summarizes selected Windows Security event IDs.

.DESCRIPTION
Reads a bounded time window from the local Windows Security log and returns
one object per selected event ID. This script is read-only and does not change
system configuration.

.PARAMETER Hours
Number of hours to look back. The default is 24.

.PARAMETER EventId
Security event IDs to summarize. Defaults to common successful logon, failed
logon, and account-lockout events.

.EXAMPLE
.\Get-SecurityEventSummary.ps1 -Hours 12 -EventId 4624,4625,4740

.NOTES
Reading the Security log may require an elevated PowerShell session.
Test only on systems you own or are authorized to administer.
#>
[CmdletBinding()]
param(
    [ValidateRange(1, 720)]
    [int]$Hours = 24,

    [ValidateNotNullOrEmpty()]
    [int[]]$EventId = @(4624, 4625, 4740)
)

$startTime = (Get-Date).AddHours(-$Hours)

try {
    $events = Get-WinEvent -FilterHashtable @{
        LogName   = 'Security'
        Id        = $EventId
        StartTime = $startTime
    } -ErrorAction Stop
}
catch [System.Diagnostics.Eventing.Reader.EventLogNotFoundException] {
    throw 'The Windows Security log was not found on this system.'
}
catch [System.UnauthorizedAccessException] {
    throw 'Access was denied. Run PowerShell with permission to read the Security log.'
}

$counts = $events | Group-Object -Property Id

foreach ($id in $EventId | Sort-Object -Unique) {
    $match = $counts | Where-Object { [int]$_.Name -eq $id }

    [pscustomobject]@{
        EventId    = $id
        Count      = if ($match) { $match.Count } else { 0 }
        WindowFrom = $startTime
        WindowTo   = Get-Date
        Computer   = $env:COMPUTERNAME
    }
}
