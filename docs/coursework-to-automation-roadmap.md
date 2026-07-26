# Coursework to Automation Roadmap

**Source:** Coursework-derived skills with independently written extensions  
**Status:** Initial portfolio conversion complete

## Skills reviewed

The coursework demonstrated:

- PowerShell command discovery and help
- Script creation and testing in PowerShell ISE
- Execution-policy awareness
- Basic error handling
- Windows event-log review
- PowerShell remoting and session cleanup
- Microsoft Graph PowerShell concepts for Microsoft 365 administration

The course documents themselves are not included because they contain personal information, school material, lab identities, and guided instructions.

## Portfolio conversion

| Coursework skill | Independent portfolio artifact | Safety control |
|---|---|---|
| Event-log review | `Get-SecurityEventSummary.ps1` | Read-only; selected event IDs; no credential handling |
| User administration | `New-LabUsers.ps1` | Disabled accounts by default, validation, and `-WhatIf` |
| Incident response | `Export-IRArtifact.ps1` | Approved local artifacts, bounded collection, hash manifest |
| Microsoft Graph | Documented reporting pattern retained in the identity-security case study | No tokens, tenant IDs, or real identities |

## Engineering standards

Every public script will:

- Use comment-based help
- Declare required privileges
- Validate inputs
- Avoid embedded secrets
- Use `SupportsShouldProcess` when state changes are possible
- Produce predictable objects rather than display-only text
- Include fictional examples
- Document side effects and limitations

## Validation boundary

The scripts were reviewed for parameter validation, unsafe credential handling, destructive behavior, error paths, and predictable outputs. Runtime validation requires an authorized Windows lab with the relevant logs or Active Directory module. That boundary is stated openly instead of presenting unexecuted code as production-tested.
