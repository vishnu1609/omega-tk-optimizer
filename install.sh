#!/bin/bash
# Omega Token Optimizer — Auto Installer
# Run from your project root: bash <(curl -s https://raw.githubusercontent.com/vishnu1609/omega-tk-optimizer/main/install.sh)

set -e
REPO="https://raw.githubusercontent.com/vishnu1609/omega-tk-optimizer/main"
TARGET=$(pwd)

echo "Omega Token Optimizer — Installer"
echo "Target: $TARGET"
echo ""

install_claude_code() {
    mkdir -p .claude/hooks
    curl -s "$REPO/claude-code/hooks/token_optimizer.py" -o .claude/hooks/token_optimizer.py
    curl -s "$REPO/claude-code/hooks/token_summary.py"   -o .claude/hooks/token_summary.py
    curl -s "$REPO/claude-code/hooks/token_leaderboard.py" -o .claude/hooks/token_leaderboard.py
    curl -s "$REPO/claude-code/settings.json"            -o .claude/settings.json
    chmod +x .claude/hooks/token_optimizer.py
    echo "  [✓] Claude Code — restart Claude Code to activate"
}

install_cursor() {
    curl -s "$REPO/cursor/.cursorrules" -o .cursorrules
    echo "  [✓] Cursor — .cursorrules added"
}

install_copilot() {
    mkdir -p .github
    curl -s "$REPO/copilot/.github/copilot-instructions.md" -o .github/copilot-instructions.md
    echo "  [✓] GitHub Copilot — .github/copilot-instructions.md added"
}

install_windsurf() {
    curl -s "$REPO/windsurf/.windsurfrules" -o .windsurfrules
    echo "  [✓] Windsurf — .windsurfrules added"
}

install_aider() {
    curl -s "$REPO/aider/.aider.conf.yml" -o .aider.conf.yml
    echo "  [✓] Aider — .aider.conf.yml added"
}

echo "Which AI tool? (enter numbers, space-separated)"
echo "  1) Claude Code"
echo "  2) Cursor"
echo "  3) GitHub Copilot"
echo "  4) Windsurf"
echo "  5) Aider"
echo "  6) All"
read -r choices

for choice in $choices; do
    case $choice in
        1) install_claude_code ;;
        2) install_cursor ;;
        3) install_copilot ;;
        4) install_windsurf ;;
        5) install_aider ;;
        6) install_claude_code; install_cursor; install_copilot; install_windsurf; install_aider ;;
    esac
done

echo ""
echo "Done. Token optimizer active — est. 35-50% fewer output tokens per session."
