#!/bin/bash
set -e

RUNNER_NAME=${RUNNER_NAME:-"self-hosted-runner"}
RUNNER_WORKDIR=${RUNNER_WORKDIR:-"/home/runner/_work"}
GITHUB_URL=${GITHUB_URL:-""}
GITHUB_TOKEN=${GITHUB_TOKEN:-""}
RUNNER_LABELS=${RUNNER_LABELS:-"self-hosted,linux,x64"}
RUNNER_GROUP=${RUNNER_GROUP:-"default"}

if [ -z "$GITHUB_URL" ] || [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: GITHUB_URL and GITHUB_TOKEN must be set"
  echo "  GITHUB_URL: URL of the GitHub repository or organization"
  echo "  GITHUB_TOKEN: Personal access token with repo scope"
  exit 1
fi

# Configure the runner
./config.sh \
  --url "${GITHUB_URL}" \
  --token "${GITHUB_TOKEN}" \
  --name "${RUNNER_NAME}" \
  --work "${RUNNER_WORKDIR}" \
  --labels "${RUNNER_LABELS}" \
  --runnergroup "${RUNNER_GROUP}" \
  --unattended \
  --replace

# Cleanup on exit
cleanup() {
  echo "Removing runner..."
  ./config.sh remove --token "${GITHUB_TOKEN}" || true
}
trap cleanup EXIT

# Start the runner
./run.sh
