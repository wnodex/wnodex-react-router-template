#!/bin/bash
set -e

# Arguments: $1 = github.event_name, $2 = github.event.release.tag_name
EVENT_NAME=$1
RELEASE_TAG=$2

if [ "$EVENT_NAME" == "release" ]; then
  TAG="$RELEASE_TAG"
else
  # Check if the current commit has an exact tag match
  CURRENT_TAG=$(git describe --tags --exact-match 2> /dev/null || echo "")
  if [ -n "$CURRENT_TAG" ]; then
    TAG="$CURRENT_TAG"
  else
    # Otherwise use the commit SHA
    TAG="sha-$(git rev-parse HEAD)"
  fi
fi

echo "$TAG"
