# Claude Code Plugins

[Claude Code](https://claude.com/claude-code) plugins for the AI Assistant marketplace.

> **Want to build your own skills?** See the [Skill Development Guide](../docs/SKILL-DEVELOPMENT.md)—build AI augmentation that fits your specific work, not autonomous robots.

## Installation

```bash
/plugin marketplace add rise8-us/xpai-ai-assistant-container
```

## Available Plugins (Beta)

All plugins are currently in beta. Use them explicitly by name (e.g., "use product-owner-beta to assess this story").

| Plugin | Description |
|--------|-------------|
| [claude-whisperer-beta](./claude-whisperer-beta) | Meta-skills for building your Iron Man suit |
| [cybersecurity-engineer-beta](./cybersecurity-engineer-beta) | CVE triage, vulnerability assessment, POA&M docs |
| [platform-engineer-beta](./platform-engineer-beta) | CI/CD troubleshooting, infrastructure diagnostics |
| [product-owner-beta](./product-owner-beta) | Assess stories, refine requirements |
| [release-engineer-beta](./release-engineer-beta) | Update changelogs, manage versions |
| [software-engineer-beta](./software-engineer-beta) | Implement stories with TDD, atomic commits |

## Contributing

These are beta plugins - we're actively iterating on them. To contribute:

1. Clone this repo
2. Edit plugins directly in `plugins/*-beta/`
3. Test with: `/plugin marketplace add ./.claude` then `/plugin install <plugin>@local-dev`
4. Submit a PR with your improvements

See the [Skill Development Guide](../docs/SKILL-DEVELOPMENT.md) for detailed instructions.

## Documentation

- [Skill Development Guide](../docs/SKILL-DEVELOPMENT.md) - Build your Iron Man suit
- [Changelog](./CHANGELOG.md) - What's new
- [Claude Code Plugins Reference](https://code.claude.com/docs/en/plugins-reference) - Official docs
