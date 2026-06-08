#!/usr/bin/env bash
# Zouk Skills & Agents — macOS / Linux Installer
# Run: bash install.sh

set -e

RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; GRAY='\033[0;37m'; NC='\033[0m'

echo ""
echo -e "  ${RED}╔══════════════════════════════════════╗${NC}"
echo -e "  ${RED}║   Zouk Skills & Agents  v1.0         ║${NC}"
echo -e "  ${RED}║   macOS / Linux Installer            ║${NC}"
echo -e "  ${RED}╚══════════════════════════════════════╝${NC}"
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
AGENTS_DIR="$CLAUDE_DIR/agents"
SKILLS_DIR="$CLAUDE_DIR/skills"

step() { echo -e "  ${CYAN}→ $1${NC}"; }
ok()   { echo -e "  ${GREEN}✓ $1${NC}"; }
warn() { echo -e "  \033[33m! $1\033[0m"; }

# 1. Create dirs
step "Creating ~/.claude/agents/ ..."
mkdir -p "$AGENTS_DIR"
ok "~/.claude/agents/ ready"

step "Creating ~/.claude/skills/ ..."
mkdir -p "$SKILLS_DIR"
ok "~/.claude/skills/ ready"

# 2. Copy agents
if [ -d "$SCRIPT_DIR/agents" ]; then
    step "Installing agents..."
    count=$(find "$SCRIPT_DIR/agents" -maxdepth 1 -name "*.md" | wc -l | tr -d ' ')
    cp "$SCRIPT_DIR/agents/"*.md "$AGENTS_DIR/"
    ok "$count agents installed to ~/.claude/agents/"
else
    warn "agents/ folder not found — skipping"
fi

# 3. Copy skills
if [ -d "$SCRIPT_DIR/skills" ]; then
    step "Installing skills..."
    count=0
    for skill_dir in "$SCRIPT_DIR/skills"/*/; do
        if [ -d "$skill_dir" ]; then
            skill_name=$(basename "$skill_dir")
            cp -r "$skill_dir" "$SKILLS_DIR/$skill_name"
            count=$((count + 1))
        fi
    done
    ok "$count skills installed to ~/.claude/skills/"
else
    warn "skills/ folder not found — skipping"
fi

echo ""
echo -e "  ${GRAY}══════════════════════════════════════${NC}"
echo -e "  ${GREEN}Installation complete!${NC}"
echo ""
echo "  Next steps:"
echo -e "  ${GRAY}  1. Open Claude Code${NC}"
echo -e "  ${GRAY}  2. Agents are now active automatically${NC}"
echo -e "  ${GRAY}  3. Reference skills with /skill-name in chat${NC}"
echo -e "  ${GRAY}  4. See LOADOUTS.md for recommended combos${NC}"
echo ""
echo -e "  ${GRAY}Installed to: $CLAUDE_DIR${NC}"
echo ""
