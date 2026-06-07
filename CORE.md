# CORE

This file defines the small always-on operating layer for the repository.

Do not load every agent and skill by default. Keep the core small, then route into project loadouts or the searchable library.

## Always-On Skills

- workspace-surface-audit
- agent-sort
- skill-scout
- skill-stocktake
- prompt-optimizer
- context-budget
- token-budget-advisor
- security-scan
- safety-guard
- plan-orchestrate

## Always-On Agents

- chief-of-staff
- code-reviewer
- doc-updater

## Core Jobs

1. Decide what the user is trying to do.
2. Pick the smallest useful skill set.
3. Keep long-tail skills in the library until needed.
4. Prevent duplicate skill creation.
5. Keep context small.
6. Keep scripts and hooks reviewed before use.

## Rule

The core layer routes work. It should not try to do every job itself.
