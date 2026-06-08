#!/usr/bin/env bash
# Zouk Skills & Agents — Mac Installer
# Double-click this file in Finder to install

cd "$(dirname "$0")"

echo ""
echo "  =========================================="
echo "    Zouk Skills & Agents  v1.0"
echo "    Mac Installer"
echo "  =========================================="
echo ""

AGENTS_DIR="$HOME/.claude/agents"
SKILLS_DIR="$HOME/.claude/skills"

echo "  Creating folders..."
mkdir -p "$AGENTS_DIR"
mkdir -p "$SKILLS_DIR"

echo "  Installing agents..."
if [ -d "./agents" ]; then
    cp ./agents/*.md "$AGENTS_DIR/"
    COUNT=$(ls ./agents/*.md 2>/dev/null | wc -l | tr -d ' ')
    echo "  Done: $COUNT agents installed."
else
    echo "  ! agents/ folder not found"
fi

echo "  Installing skills..."
if [ -d "./skills" ]; then
    COUNT=0
    for skill_dir in ./skills/*/; do
        [ -d "$skill_dir" ] || continue
        skill_name=$(basename "$skill_dir")
        cp -r "$skill_dir" "$SKILLS_DIR/$skill_name"
        COUNT=$((COUNT + 1))
    done
    echo "  Done: $COUNT skills installed."
else
    echo "  ! skills/ folder not found"
fi

echo ""
echo "  =========================================="
echo "  Installation complete!"
echo ""
echo "  Next steps:"
echo "    1. Open Claude Code"
echo "    2. Agents are active immediately"
echo "    3. See LOADOUTS.md to pick a skill bundle"
echo "  =========================================="
echo ""
read -p "  Press Enter to close..."
