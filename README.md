# AI Assistant Container

A monorepo containing the AI assistant base container and starter template for project teams.

## Projects

- [`image/`](image/) - Base container with pre-configured AI tools (Claude Code, Gemini CLI, Goose)
- [`starter/`](starter/) - Starter template for project teams

## Architecture

```
┌─────────────────────────────────────────────────┐
│   xpai-ai-assistant-container (this repo)       │
│                                                  │
│  ┌─────────────────────────────────────────┐   │
│  │  image/                                  │   │
│  │  Builds: ghcr.io/.../ai-assistant-home  │   │
│  └──────────────┬──────────────────────────┘   │
│                 │ base image                    │
│                 ▼                               │
│  ┌─────────────────────────────────────────┐   │
│  │  starter/                                │   │
│  │  Publishes to external read-only repo   │   │
│  └─────────────────────────────────────────┘   │
└─────────────────────────────────────────────────┘
```

## Container Images

The base container is published to:
- **Registry:** GitHub Container Registry (GHCR)
- **Image:** `ghcr.io/rise8-us/xpai/ai-assistant-home`
- **Tags:** `latest`, `<version>`, `sha-<git-sha>`

## Publishing

The starter repository is automatically published to [xpai-ai-assistant-container-starter](https://github.com/rise8-us/xpai-ai-assistant-container-starter) as a read-only repository.

See [`starter/publish-to-external-repo.sh`](starter/publish-to-external-repo.sh) for the publishing process.

## Development

### Building the Base Container

```bash
cd image
docker build -t ai-assistant-home .
docker run -it ai-assistant-home bash
```

### Testing

```bash
cd image
./scripts/test.sh
```

### Security Scanning

```bash
cd image
./scripts/scan-locally.sh
```

## GitHub Actions

This repository includes automated workflows:

- **Build & Publish Base Container** - Builds and publishes `ai-assistant-home` to GHCR
- **Nightly Security Scan** - Daily vulnerability scanning with Trivy
- **Software Version Updates** - Automated updates for AI tools

## Contributing

See [CONTRIBUTING.md](image/CONTRIBUTING.md) for guidelines.

## License

See individual project directories for license information.
