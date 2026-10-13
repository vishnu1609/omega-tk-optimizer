# Omega Token Optimizer

**35–50% fewer output tokens per AI session.** Works with Claude Code, Cursor, GitHub Copilot, Windsurf, Aider, ChatGPT, and any AI with a system prompt.

## Quick Install (any project)

```bash
bash <(curl -s https://raw.githubusercontent.com/vishnu1609/omega-tk-optimizer/main/install.sh)
```

## Manual Install

| AI Tool | File to copy | Where |
|---|---|---|
| **Claude Code** | `claude-code/hooks/` + `claude-code/settings.json` | `.claude/` in your project |
| **Cursor** | `cursor/.cursorrules` | project root |
| **GitHub Copilot** | `copilot/.github/copilot-instructions.md` | `.github/` in your project |
| **Windsurf** | `windsurf/.windsurfrules` | project root |
| **Aider** | `aider/.aider.conf.yml` | project root |
| **ChatGPT / Claude.ai / Gemini** | paste `universal/system-prompt.md` | as system prompt |

## How It Works (Claude Code)

Three layers:

1. **`token_optimizer.py`** — fires on every prompt, strips filler words, injects intent-aware directive:

| Prompt type | Directive |
|---|---|
| Fix/bug | Show only changed lines + one-line reason |
| Write code | Code only, no prose |
| Explain/how/what | Max 3 bullet points |
| Yes/No | One sentence |
| List | Bullets only |
| Refactor | Diff only |

2. **`token_summary.py`** — shows savings at session end
3. **`token_leaderboard.py`** — all-time savings across sessions

```bash
python3 .claude/hooks/token_leaderboard.py
```

## Savings Estimate

| Layer | Reduction |
|---|---|
| Filler word stripping | ~5–15% input tokens |
| Intent-aware directive | ~35–50% output tokens |
| CLAUDE.md base rule | ~10–20% output tokens |

## License

MIT — use it anywhere, share it freely.
