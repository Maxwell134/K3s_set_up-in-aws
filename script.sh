
# Set variables
REPO="7002370412/tumlog"
DOCKER_REGISTRY="https://registry.hub.docker.com"

VALUES_FILE="mychart/values.yaml"
# Fetch the latest tag from Docker Hub (this is a simplified example; Docker Hub API may require authentication or have different endpoints)
LATEST_TAG=$(curl -s "https://registry.hub.docker.com/v2/repositories/$REPO/tags/latest" | jq -r '.name')


echo "Latest Tag: $LATEST_TAG"
# Update the tag in the values.yaml file
sed -i '' "s/tag:.*/tag: \"$LATEST_TAG\"/" mychart/values.yaml


#cat $VALUES_FILE
