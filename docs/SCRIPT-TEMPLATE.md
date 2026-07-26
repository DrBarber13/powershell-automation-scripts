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
