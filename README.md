# AI Agent Skills for OpenClaw

188 production-tested AI agent skills for OpenClaw. Built by [MTNT Solutions FZE](https://agent-hub.shop).

## Quick Install

```bash
# Clone
git clone https://github.com/mtsatryan/openclaw-ai-agents.git
cd openclaw-ai-agents

# Install all skills
cp -r */ ~/.openclaw/skills/

# Restart gateway
openclaw gateway restart
# or if using daemon:
# openclaw daemon restart

# Verify
openclaw skills list
```

## Install Specific Skills

```bash
# Install only what you need
cp -r python-pro ~/.openclaw/skills/
cp -r react-pro ~/.openclaw/skills/
cp -r orchestrator-v5 ~/.openclaw/skills/
```

## Requirements

- [OpenClaw](https://github.com/openclaw/openclaw) 2026.4+
- Node.js 22.14+
- Any LLM provider configured (Anthropic, OpenAI, etc.)

## What's Included

**188 skills across 15 categories:**

| Category | Skills | Examples |
|----------|--------|---------|
| Programming Languages | 14 | python-pro, golang-pro, rust-pro, typescript-pro |
| Frontend & Mobile | 18 | react-pro, nextjs-pro, flutter-expert, vue-specialist |
| Backend & API | 14 | backend-architect, api-designer, django-developer |
| Database & Data | 8 | postgres-pro, sql-pro, data-engineer, analytics-engineer |
| AI/ML & LLM | 9 | ai-engineer, llm-architect, prompt-engineer, mlops-engineer |
| Cloud & DevOps | 14 | devops-engineer, kubernetes-expert, terraform-engineer |
| Testing & QA | 7 | test-engineer, e2e-test-specialist, qa-expert |
| Security & Compliance | 7 | security-auditor, penetration-tester, compliance-auditor |
| Business & Product | 10 | product-strategist, project-manager, scrum-master |
| Content & Media | 19 | technical-writer, video-script-writer, seo-specialist |
| Agent Coordination | 18 | orchestrator-v5, multi-agent-coordinator, workflow-orchestrator |
| Specialized Domains | 13 | ecommerce-expert, healthcare-dev, game-developer |
| PowerShell & Windows | 7 | powershell-7-expert, windows-infra-admin, m365-admin |
| Analysis & Research | 6 | data-analyst, market-researcher, trend-analyst |
| DevTools & Utilities | 20 | code-reviewer, error-detective, debugger |

## Orchestrator V5

The `orchestrator-v5` skill is the master router. It analyzes your request, selects the best skills, and coordinates multi-skill workflows.

**Automatic activation:** Just describe a complex task — the orchestrator triggers when it detects multi-domain work.

**Manual activation:**
```
/orchestrator-v5 Build a SaaS platform with React, FastAPI, PostgreSQL, and CI/CD
```

**What it does:**
1. Analyzes your task and detects domains
2. Selects optimal skills with confidence scoring
3. Creates a phased execution plan (Sequential / Parallel / Hybrid)
4. Sets checkpoints for your approval at key decisions

## Skill Format

Each skill follows the [AgentSkills spec](https://agentskills.io):

```
skill-name/
├── SKILL.md              # Main skill file (YAML frontmatter + instructions)
└── references/            # Optional: code examples, large content
    └── examples.md
```

**SKILL.md structure:**
```yaml
---
name: skill-name
description: 'What this skill does. Use when: trigger conditions.'
---

# Skill Title

Instructions, expertise, patterns...
```

## How Skills Trigger

1. OpenClaw reads `name` + `description` from every installed skill
2. When you send a message, the LLM matches your request against descriptions
3. If a skill matches, its full SKILL.md body loads into context
4. The LLM follows the skill's instructions to respond

**The `description` field is critical** — it determines when the skill activates. Each description includes "Use when:" trigger conditions.

## Usage Examples

**Single skill (auto-triggered):**
```
Write a Python FastAPI app with JWT authentication
→ python-pro activates automatically
```

**Multi-skill via orchestrator:**
```
/orchestrator-v5 Build a healthcare app with HIPAA compliance, React frontend, Python backend, deploy to Kubernetes
→ Orchestrator selects: healthcare-dev, compliance-auditor, react-pro, python-pro, kubernetes-expert, security-auditor
→ Creates 6-phase plan with checkpoints
```

**Direct skill invocation:**
```
/security-auditor Review my authentication implementation for OWASP Top 10 vulnerabilities
```

## Customization

**Edit a skill:**
```bash
vim ~/.openclaw/skills/python-pro/SKILL.md
# Changes apply on next message (hot reload)
```

**Create a new skill:**
```bash
mkdir ~/.openclaw/skills/my-skill
cat > ~/.openclaw/skills/my-skill/SKILL.md << 'EOF'
---
name: my-skill
description: 'What it does. Use when: conditions.'
---

Your instructions here.
EOF
```

## Compatibility

These skills work with any LLM provider configured in OpenClaw:
- Anthropic (Claude Sonnet, Opus, Haiku)
- OpenAI (GPT-4, GPT-5)
- DeepSeek
- Google Gemini
- Ollama (local models)

Best results with Claude Sonnet 4.6+ or GPT-5+.

## Origin

Originally built as [Claude Code agents](https://agent-hub.shop) for Claude CLI, Cline, Aider, and Codex CLI. Converted to OpenClaw format with automated tooling. Each skill is 50-500 lines of curated, tested instructions.

## License

MIT

## Links

- Web: [agent-hub.shop](https://agent-hub.shop)
- GitHub: [mtsatryan/openclaw-ai-agents](https://github.com/mtsatryan/openclaw-ai-agents)
- OpenClaw: [openclaw.ai](https://openclaw.ai)
