# PowerShell Security Automation

**Status:** Three independently written security-administration scripts complete  
**Project source:** Coursework-derived concepts plus independent scripts

## Overview

Small, safety-conscious PowerShell tools for Windows administration, evidence collection, and repeatable lab tasks. Every script should include help text, input validation, error handling, least-privilege notes, and sample output using fictional data.

## Script roadmap

| Script | Purpose | Source | Status |
|---|---|---|---|
| [`Get-SecurityEventSummary.ps1`](scripts/Get-SecurityEventSummary.ps1) | Summarize selected Windows security events | Independent extension of coursework | Complete |
| [`New-LabUsers.ps1`](scripts/New-LabUsers.ps1) | Create disabled fictional lab users from sanitized CSV input | Coursework-derived + independently rewritten | Complete |
| [`Export-IRArtifact.ps1`](scripts/Export-IRArtifact.ps1) | Collect approved Windows host artifacts with a hash manifest | Independent project | Complete |

## Coursework-to-project progression

The private coursework demonstrated PowerShell fundamentals, ISE workflow, help and discovery, execution-policy concepts, event-log review, remoting, and Microsoft Graph administration. The public repository contains newly written code only. See [Coursework to automation roadmap](docs/coursework-to-automation-roadmap.md).

## Repository structure

```text
scripts/    Reviewed PowerShell scripts
examples/   Sanitized sample inputs and outputs
docs/       Design notes and safety guidance
```

## Quality checklist

- No credentials, secrets, real identities, or organization details
- Supports `-WhatIf` for changes where practical
- Documents required privileges and side effects
- Uses fictional sample data
- Includes a documented positive, negative, and safety test plan
- Is ready for PSScriptAnalyzer and Windows-lab validation

## Validation status

The code received a static safety and structure review in this workspace. It was not executed here because this workspace is macOS-based and does not provide Windows Security logs, Active Directory cmdlets, or a Windows PowerShell runtime. The repository does not claim runtime validation that did not occur.

## Disclaimer

Run scripts only on systems you own or are authorized to administer. Review and test in an isolated lab before production use.
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
