# Metallic.v1 Skills + Agents OS

A modular operating layer for AI skills, agents, workflows, hooks, and reusable execution patterns.

This repository is designed to hold a large library of agents and skills without forcing every model/session to load everything at once. The goal is simple: keep the full library available, but route only the right tools into the right job.

## Core Idea

- **Agents** are specialist roles.
- **Skills** are reusable workflows.
- **Hooks/scripts** are automation and enforcement surfaces.
- **Loadouts** are project-specific bundles.
- **Router files** decide what should be used for each task.

## Recommended Operating Model

Do not load the entire repo into every Open WebUI, Claude, Codex, or local model session.

Use this model instead:

1. **CORE** — always-loaded operating layer.
2. **LOADOUTS** — project/task-specific bundles.
3. **LIBRARY** — searchable long-tail skills and agents.

## Start Here

Read these files first:

- `CORE.md` — the small set of always-on skills/agents.
- `ROUTER.md` — task-to-skill routing map.
- `LOADOUTS.md` — Open WebUI and project bundle recommendations.
- `CATALOG.md` — current known index and audit notes.

## High-Value Use Cases

- Local Open WebUI agent setup
- Claude Code / Codex workflow setup
- Skill and agent routing
- Website/app audit workflows
- Security review before public release
- Open-source project packaging
- Business workflow automation
- Lead intelligence and client acquisition
- Prompt optimization and context control

## Safety Rule

Scripts, hooks, and imported/community skills should be treated as untrusted until reviewed. Do not auto-run hooks or shell scripts until they are categorized and approved in a loadout.

## Maintenance

Run or adapt `scripts/catalog.mjs` to generate a fresh inventory of skills, agents, hooks, commands, and potentially risky executable files.
