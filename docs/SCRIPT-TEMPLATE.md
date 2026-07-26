# Script Documentation Standard

Every public script includes:

- comment-based help and sanitized examples;
- source classification and validation status;
- PowerShell, platform, module, and privilege requirements;
- typed and validated parameters;
- predictable object or file outputs;
- `SupportsShouldProcess` for state-changing or file-writing operations;
- explicit error handling for expected failure conditions;
- no embedded credentials, tokens, tenant IDs, or private infrastructure values;
- positive, negative, and safety test cases; and
- known limitations and side effects.

Scripts are labeled as statically reviewed until they have been executed with PSScriptAnalyzer and tested in an authorized Windows lab.
# [Script Name]

**Source:** [Coursework-derived / Independent project / Coursework-derived + independently rewritten]  
**Status:** [Planned / Testing / Complete]

## Purpose
[Problem solved and intended users.]

## Requirements and privileges
[PowerShell version, modules, and least privilege.]

## Inputs and outputs
[Parameters, formats, and sanitized examples.]

## Safety behavior
[Validation, `-WhatIf`, logging, error handling, and side effects.]

## Testing
[Pester tests and manual lab validation.]

## Limitations
[Known constraints and unsupported environments.]

## Lessons learned
[Engineering and security takeaways.]
