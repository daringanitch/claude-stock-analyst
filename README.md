# claude-stock-analyst

13 Claude Code skills that turn Claude into a Bloomberg-grade equity analyst. One install script. Works in every Claude Code session.

## Install

```bash
git clone https://github.com/daringanitch/claude-stock-analyst
cd claude-stock-analyst
bash install.sh
```

Start a new `claude` session after installing — skills load automatically.

## The 13 Skills

### Master entry point
| Skill | What it does |
|-------|-------------|
| `/stock-analyst` | Explains the full system, dispatch table, research workflows, analyst standards |

### Research & Screening
| Skill | What it does |
|-------|-------------|
| `/stock-screen [TICKER]` | 1-page company overview — business model, margins, moat rating, bull/bear in 2 sentences |
| `/stock-sector [SECTOR]` | Industry macro setup — tailwinds, cycle position, regulatory backdrop, best-positioned players |
| `/stock-filing` | 10-K/10-Q deep dive — what changed, buried footnotes, MD&A language shifts, top 3 things a casual reader misses |

### Financial Analysis
| Skill | What it does |
|-------|-------------|
| `/stock-earnings [TICKER]` | Beat/miss scorecard, guidance analysis, quality of beat, red flags, Raise/Hold/Trim verdict |
| `/stock-valuation [TICKER]` | Relative, DCF, reverse DCF, private market value — bear/base/bull price table |
| `/stock-balance-sheet [TICKER]` | Net debt, maturity wall, liquidity, covenants, off-balance-sheet, 25% revenue drop scenario |

### Qualitative Analysis
| Skill | What it does |
|-------|-------------|
| `/stock-moat [TICKER]` | Morningstar 5-source moat analysis — cost, switching costs, network effects, intangibles, efficient scale |
| `/stock-management [TICKER]` | Scorecard /50 — capital allocation, execution, candor, skin in game, long-term thinking |
| `/stock-red-flags [TICKER]` | Accounting + governance + ops checklist — GREEN/YELLOW/RED per item, aggregate risk rating |

### Investment Decision
| Skill | What it does |
|-------|-------------|
| `/stock-thesis [TICKER]` | Full hedge fund PM thesis — setup, bull/base/bear cases, catalysts, position sizing signal, exit criteria |
| `/stock-monitor [TICKER @ PRICE]` | Monitoring framework for positions you own — KPIs, sell triggers, add triggers, next catalyst |
| `/stock-portfolio [tickers]` | Portfolio risk heat map — concentration, factor exposure, correlation, macro sensitivity, blind spots |

## Research Workflows

**Full due diligence on a new stock:**
```
/stock-screen → /stock-sector → /stock-moat → /stock-management
→ /stock-red-flags → /stock-valuation → /stock-balance-sheet → /stock-thesis
```

**Earnings season rapid review:**
```
/stock-earnings → /stock-valuation → /stock-monitor (if already long)
```

**Quick 5-minute idea filter:**
```
/stock-screen → /stock-red-flags → /stock-thesis (only if both pass)
```

## Examples

See the [`examples/`](examples/) directory for real output from each skill:

| File | Skill | What it shows |
|------|-------|--------------|
| [thesis-MSFT.md](examples/thesis-MSFT.md) | `stock-thesis` | Full hedge fund PM thesis on Microsoft |
| [thesis-AMD.md](examples/thesis-AMD.md) | `stock-thesis` | Full thesis on AMD — CPU vs GPU split conviction |
| [screen-NVDA.md](examples/screen-NVDA.md) | `stock-screen` | 1-page NVIDIA overview with moat scorecard |
| [red-flags-UBER.md](examples/red-flags-UBER.md) | `stock-red-flags` | GREEN/YELLOW/RED checklist for Uber |
| [earnings-AAPL-Q2-2025.md](examples/earnings-AAPL-Q2-2025.md) | `stock-earnings` | Full Apple Q2 2025 earnings review |
| [portfolio-risk-11positions.md](examples/portfolio-risk-11positions.md) | `stock-portfolio` | Portfolio risk heat map across 11 positions |

```
/stock-thesis MSFT
/stock-earnings AAPL Q2
/stock-screen NVDA
/stock-red-flags UBER
/stock-moat GOOGL
/stock-portfolio MSFT GOOGL AMZN META NVDA
```

Skills also trigger automatically — say "run earnings on Datadog" and Claude invokes `/stock-earnings` without the slash.

## Requirements

- [Claude Code](https://claude.ai/code) (any plan)
- No API keys, no additional setup

## License

MIT
