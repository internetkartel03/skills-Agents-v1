# Workflow: Feature Build (TDD)
> Category: Development

## Purpose
Build a new feature from planning through implementation using test-driven development.

## Agents to Activate
- `planner` — create implementation plan
- `tdd-guide` — enforce write-tests-first
- `code-reviewer` — review after implementation
- `build-error-resolver` — fix build issues fast

## Skills to Load
- `tdd-workflow`
- `coding-standards`
- `git-workflow`
- `error-handling`
- `deployment-patterns`

## Steps
1. **Plan** — activate `planner`, produce task list and architecture sketch
2. **Test** — activate `tdd-guide`, write failing tests first (RED)
3. **Build** — implement minimal code to pass tests (GREEN)
4. **Refactor** — clean up while keeping tests green (IMPROVE)
5. **Review** — activate `code-reviewer`, fix CRITICAL and HIGH findings
6. **Commit** — follow `git-workflow` commit message format

## Rules
- Never skip the test-first step
- Coverage target: 80% minimum
- No commit with CRITICAL findings open

## Time Estimate
1–4 hours per feature depending on complexity.
