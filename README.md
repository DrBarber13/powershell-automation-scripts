# PowerShell Security Automation

**Status:** Coursework analyzed; first independent script added  
**Project source:** Coursework-derived concepts plus independent scripts

## Overview

Small, safety-conscious PowerShell tools for Windows administration, evidence collection, and repeatable lab tasks. Every script should include help text, input validation, error handling, least-privilege notes, and sample output using fictional data.

## Script roadmap

| Script | Purpose | Source | Status |
|---|---|---|---|
| [`Get-SecurityEventSummary.ps1`](scripts/Get-SecurityEventSummary.ps1) | Summarize selected Windows security events | Independent extension of coursework | Complete |
| `New-LabUsers.ps1` | Create fictional lab users from sanitized input | Coursework-derived + independently rewritten | Planned |
| `Export-IRArtifact.ps1` | Collect approved host artifacts for a lab case | Independent project | Planned |

## Coursework-to-project progression

The private coursework demonstrated PowerShell fundamentals, ISE workflow, help and discovery, execution-policy concepts, event-log review, remoting, and Microsoft Graph administration. The public repository contains newly written code only. See [Coursework to automation roadmap](docs/coursework-to-automation-roadmap.md).

## Repository structure

```text
scripts/    Reviewed PowerShell scripts
tests/      Pester tests
examples/   Sanitized sample inputs and outputs
docs/       Design notes and safety guidance
```

## Quality checklist

- No credentials, secrets, real identities, or organization details
- Supports `-WhatIf` for changes where practical
- Documents required privileges and side effects
- Uses fictional sample data
- Includes tests for critical logic
- Passes PSScriptAnalyzer before release

## Disclaimer

Run scripts only on systems you own or are authorized to administer. Review and test in an isolated lab before production use.
