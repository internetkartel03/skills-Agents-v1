# Workflow: Code Review Sprint
> Category: Development

## Purpose
Run a thorough quality and security review across an entire codebase or PR.

## Agents to Activate
- `code-reviewer` — quality, patterns, best practices
- `security-reviewer` — OWASP Top 10, secrets, injection
- `silent-failure-hunter` — swallowed errors, bad fallbacks
- `typescript-reviewer` or `python-reviewer` (match your stack)

## Skills to Load
- `security-review`
- `security-scan`
- `plankton-code-quality`
- `error-handling`
- `production-audit`

## Steps
1. Run `git diff main...HEAD` to scope the change surface
2. Activate `code-reviewer` — general quality pass
3. Activate `security-reviewer` — security pass
4. Activate `silent-failure-hunter` — error handling pass
5. Fix all CRITICAL findings before merge
6. Fix HIGH findings before merge when possible

## Output
- Annotated findings by severity: CRITICAL / HIGH / MEDIUM / LOW
- Recommended fixes per finding
- Go/No-Go merge decision

## Time Estimate
15–30 minutes for a standard PR.
