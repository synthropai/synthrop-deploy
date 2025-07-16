
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
  if [ $? -ne 0 ]; then
    echo "Error: Failed to clone repository. Please check your network connection and GitHub token."
    exit 1
  fi

  echo "Running Deploy..."
  cd ${REPO}
  git fetch
  git reset --hard origin/$BRANCH

  # Directories need execute (x) permission because:
  # 1. Without execute permission, you cannot access the directory contents
  # 2. Execute permission allows listing files within the directory
  # 3. Execute permission is required to access files inside the directory
  # 4. Execute permission is needed to use the directory as a working directory (cd into it)
  echo "Setting permissions to 660 for files and 770 for directories..."
  find . -type f -exec chmod 660 {} \;
  find . -type d -exec chmod 770 {} \;

  chmod +x deploy.sh
  ./deploy.sh 2>&1 > ../deploy.log
fi

echo "Done."

# FIXME chown chmod all security.
# FIXME update the token
