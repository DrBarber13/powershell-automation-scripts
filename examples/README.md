# Safe examples

Run the event summary on an authorized Windows lab host:

```powershell
.\scripts\Get-SecurityEventSummary.ps1 -Hours 12 -EventId 4624,4625,4740
```

Before publishing sample output, replace the computer name and any event-derived identities with fictional values.
