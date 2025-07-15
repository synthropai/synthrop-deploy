
REPO=synthrop-cluster
BRANCH=master

if [ "$(id -u)" -ne 0 ]; then
  echo "Error: This script must be run as root user"
  exit 1
fi

if [ ! -d /root ]; then
  echo "Error: /root directory does not exist"
  exit 1
fi

if [ -z "${GITHUB_TOKEN}" ]; then
  echo "Error: GITHUB_TOKEN environment variable is not set"
  echo "Please set the GITHUB_TOKEN environment variable with your GitHub access token"
  exit 1
fi

if [ ! -e /root/synthrop.txt ]; then
  echo "Synthrop Initial..."
  echo "Cloning ${REPO} repository..."
  cd /root
  git clone https://${GITHUB_TOKEN}@github.com/synthropai/${REPO}.git
  git fetch

  echo "Running Deploy..."
  cd ${REPO}
  git reset --hard origin/$BRANCH

  chmod +x deploy.sh
  ./deploy.sh 2>&1 > ../deploy.log & tail -F ../deploy.log &
fi

echo "Done."
