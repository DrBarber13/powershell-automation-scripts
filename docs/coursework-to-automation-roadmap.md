# Coursework to Automation Roadmap

**Source:** Coursework-derived skills with independently written extensions  
**Status:** In progress

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
| Remoting | Planned remoting health check | No embedded credentials; explicit targets; no configuration changes |
| User administration | Planned fictional lab-user creator | Input validation and `-WhatIf` |
| Microsoft Graph | Planned reporting-only example | No tokens, tenant IDs, or real identities |

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

## Next steps

1. Add Pester tests for the event summary's filtering and output shape.
2. Create a read-only remoting health check.
3. Create a fictional lab-user workflow with `-WhatIf`.
4. Run PSScriptAnalyzer and document results.
