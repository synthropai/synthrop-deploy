# Synthrop AI - Deploy

## Prerequisites

Before running the deployment script, ensure you have the following:

- Root user privileges (the script must be run as root)
- A valid GitHub access token provided by Synthrop AI (
  contact [ricneves@synthrop.ai](mailto:ricneves@synthrop.ai) for token requests)
- The GITHUB_TOKEN environment variable configured with your Synthrop AI-provided GitHub token

You can switch to the root user with:

```shell
sudo su -
```

You can set the GITHUB_TOKEN environment variable using the following command:

```shell
export GITHUB_TOKEN=your_github_token_here
```

## Quick Start

To download and run the deployment script, use the following command:

```shell
curl -fsSL https://raw.githubusercontent.com/synthropai/synthrop-deploy/refs/heads/master/deploy.sh | shell
```

Alternatively:

```shell
wget -qO- https://raw.githubusercontent.com/synthropai/synthrop-deploy/refs/heads/master/deploy.sh | shell
```

## Support

If you encounter any issues during deployment, please contact [ricneves@synthrop.ai](mailto:ricneves@synthrop.ai).
