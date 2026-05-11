#!/bin/bash
# claude-stock-analyst — install script
# Copies all 17 skills to ~/.claude/skills/ so they're available in every Claude Code session.
#
# Usage:
#   git clone https://github.com/daringanitch/claude-stock-analyst
#   cd claude-stock-analyst
#   bash install.sh

set -euo pipefail

SKILLS_DIR="$HOME/.claude/skills"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)/skills"

echo "=== claude-stock-analyst installer ==="
echo ""

# Check Claude Code is installed
if ! command -v claude &>/dev/null; then
  echo "⚠️  Claude Code not found. Install it first: https://claude.ai/code"
  exit 1
fi

mkdir -p "$SKILLS_DIR"

INSTALLED=0
SKIPPED=0

for skill_dir in "$SCRIPT_DIR"/*/; do
  skill_name="$(basename "$skill_dir")"
  target="$SKILLS_DIR/$skill_name"

  if [ -d "$target" ] && [ -f "$target/SKILL.md" ]; then
    read -rp "  '$skill_name' already exists — overwrite? [y/N]: " REPLY
    if [[ "${REPLY:-N}" =~ ^[Yy]$ ]]; then
      cp "$skill_dir/SKILL.md" "$target/SKILL.md"
      echo "  ✅ Updated: $skill_name"
      INSTALLED=$((INSTALLED + 1))
    else
      echo "  — Skipped: $skill_name"
      SKIPPED=$((SKIPPED + 1))
    fi
  else
    mkdir -p "$target"
    cp "$skill_dir/SKILL.md" "$target/SKILL.md"
    echo "  ✅ Installed: $skill_name"
    INSTALLED=$((INSTALLED + 1))
  fi
done

echo ""
echo "Done — $INSTALLED installed, $SKIPPED skipped."
echo ""
echo "Start a new claude session and try:"
echo "  /stock-analyst          — see the full system"
echo "  /stock-thesis MSFT      — investment thesis on Microsoft"
echo "  /stock-screen NVDA      — 1-page company overview"
echo "  /stock-earnings AAPL    — earnings review"
echo "  /etf-screen VOO         — ETF overview and holdings breakdown"
echo "  /etf-sector healthcare  — best ETF to express a sector view"
