# Safe examples

Run the event summary on an authorized Windows lab host:

```powershell
.\scripts\Get-SecurityEventSummary.ps1 -Hours 12 -EventId 4624,4625,4740
```

Before publishing sample output, replace the computer name and any event-derived identities with fictional values.

Example fictional output:

```text
EventId Count WindowFrom           WindowTo             Computer
------- ----- ----------           --------             --------
4624       18 2026-01-15 08:00:00  2026-01-15 20:00:00  CLIENT01
4625        5 2026-01-15 08:00:00  2026-01-15 20:00:00  CLIENT01
4740        1 2026-01-15 08:00:00  2026-01-15 20:00:00  CLIENT01
```

Preview fictional AD user creation without changing the directory:

```powershell
.\scripts\New-LabUsers.ps1 `
    -CsvPath .\examples\fictional-lab-users.csv `
    -Path "OU=Policy Test,DC=corp,DC=example" `
    -WhatIf
```

Collect a bounded incident-response package:

```powershell
.\scripts\Export-IRArtifact.ps1 `
    -OutputPath C:\IR\Case-001 `
    -Hours 24 `
    -IncludeSecurityLog `
    -WhatIf
```
# Safe examples

Run the event summary on an authorized Windows lab host:

```powershell
.\scripts\Get-SecurityEventSummary.ps1 -Hours 12 -EventId 4624,4625,4740
```

Before publishing sample output, replace the computer name and any event-derived identities with fictional values.
