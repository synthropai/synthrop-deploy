# Synthrop AI

## Prerequisites

Before running the deployment script, ensure you have the following:

- A valid GitHub access token provided by Synthrop AI company (
  contact [ricneves@synthrop.ai](mailto:ricneves@synthrop.ai) for token request)
- The GITHUB_TOKEN environment variable configured with your Synthrop-provided GitHub token

You can set the GITHUB_TOKEN environment variable using the following command:

```bash
export GITHUB_TOKEN=your_github_token_here
```

## Quick Start

To download and run the deployment script, use the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/synthropai/synthrop-deploy/refs/heads/master/deploy.sh | bash
```

Or alternatively:

```bash
wget -qO- https://raw.githubusercontent.com/synthropai/synthrop-deploy/refs/heads/master/deploy.sh | bash
```
