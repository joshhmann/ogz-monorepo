#!/bin/bash
set -e

echo "=== Building MatchServer in Docker ==="

# Build the image
docker build --platform linux/amd64 -f Dockerfile.build -t gunz-builder .

# Create a temporary container and copy the binary out
docker create --name gunz-build-temp gunz-builder
docker cp gunz-build-temp:/build/install/MatchServer ./install/
docker rm gunz-build-temp

echo "=== Build complete! ==="
echo "Binary location: install/MatchServer"
echo ""
echo "Next steps:"
echo "  cp install/MatchServer ../ogz-server/"
echo "  cd ../ogz-server && docker compose build --no-cache && docker compose up -d"
