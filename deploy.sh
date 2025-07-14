
REPO=synthrop-cluster

#if [ "$(id -u)" -ne 0 ]; then
#  echo "Error: This script must be run as root user"
#  exit 1
#fi FIXME check root user

if [ -z "${GITHUB_TOKEN}" ]; then
  echo "Error: GITHUB_TOKEN environment variable is not set"
  echo "Please set the GITHUB_TOKEN environment variable with your GitHub access token"
  exit 1
fi

if [ ! -e /root/synthrop.txt ]; then
  echo "Synthrop Initial..."
  echo "Cloning ${REPO} repository..."
  git clone https://${GITHUB_TOKEN}@github.com/synthropai/${REPO}.git
fi

