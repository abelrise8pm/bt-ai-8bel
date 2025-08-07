#!/bin/bash
# Local security scanning script for AI assistant container
# Builds the container image and scans it for vulnerabilities using Trivy
# Returns 0 on success, 1 on any failure

set -e  # Exit on any error

# Configuration
IMAGE_TAG=${IMAGE_TAG:-"localhost/ai-assistant-home:latest"}
CONTAINER_RUNTIME=${CONTAINER_RUNTIME:-$(command -v podman > /dev/null && echo "podman" || echo "docker")}
SEVERITY=${SEVERITY:-"CRITICAL,HIGH"}
SCAN_FORMAT=${SCAN_FORMAT:-"table"}

echo "🔨 Building and scanning AI assistant container..."
echo "📋 Configuration:"
echo "  Container Runtime: $CONTAINER_RUNTIME"
echo "  Image Tag: $IMAGE_TAG"
echo "  Scan Severity: $SEVERITY"
echo "  Scan Format: $SCAN_FORMAT"
echo ""

# Check if container runtime is available
if ! command -v "$CONTAINER_RUNTIME" > /dev/null; then
    echo "❌ ERROR: Container runtime '$CONTAINER_RUNTIME' not found. Please install 'podman' or 'docker'."
    exit 1
fi

# Check if Trivy is available
if ! command -v trivy > /dev/null; then
    echo "❌ ERROR: Trivy not found. Please install Trivy:"
    echo "  # macOS with Homebrew"
    echo "  brew install trivy"
    echo ""
    echo "  # Linux with package manager (example for Ubuntu/Debian)"
    echo "  sudo apt-get update && sudo apt-get install trivy"
    exit 1
fi

# Force fresh build (no cache) to ensure we scan the latest code
echo "🧹 Forcing fresh build (no cache)..."

# Build the container
echo "🔨 Building container image: $IMAGE_TAG"

# Check if GITHUB_PACKAGE_READ_TOKEN is set (required for npm package installation)
if [[ -z "$GITHUB_PACKAGE_READ_TOKEN" ]]; then
    echo "⚠️  GITHUB_PACKAGE_READ_TOKEN not found. Attempting to load from .env file..."

    if [[ -f ".env" ]]; then
        echo "📁 Found .env file. Loading environment variables..."
        # Source the .env file to load variables
        set -a  # automatically export all variables
        source .env
        set +a  # turn off automatic export

        # Re-check if variable is now set
        if [[ -z "$GITHUB_PACKAGE_READ_TOKEN" ]]; then
            echo "❌ ERROR: GITHUB_PACKAGE_READ_TOKEN still not found after loading .env file"
            echo "  This token is needed to install private npm packages from GitHub Package Registry"
            echo "  Please either:"
            echo "  1. Set environment variable directly:"
            echo "     export GITHUB_PACKAGE_READ_TOKEN=your_github_token"
            echo "  2. Or add GITHUB_PACKAGE_READ_TOKEN to .env file"
            echo ""
            echo "For GITHUB_PACKAGE_READ_TOKEN: This token needs 'read:packages' permission"
            echo "to access @rise8-us/dev-commands-mcp-server from GitHub Packages."
            exit 1
        fi
        echo "✅ GITHUB_PACKAGE_READ_TOKEN loaded from .env file"
    else
        echo "❌ ERROR: GITHUB_PACKAGE_READ_TOKEN environment variable is required for building the container"
        echo "  This token is needed to install private npm packages from GitHub Package Registry"
        echo "  Please either:"
        echo "  1. Set environment variable directly:"
        echo "     export GITHUB_PACKAGE_READ_TOKEN=your_github_token"
        echo "  2. Or create a .env file with this variable"
        echo ""
        echo "For GITHUB_PACKAGE_READ_TOKEN: This token needs 'read:packages' permission"
        echo "to access @rise8-us/dev-commands-mcp-server from GitHub Packages."
        exit 1
    fi
fi

# Create a temporary file for the GitHub token (more compatible with both Docker and Podman)
TOKEN_FILE=$(mktemp)
echo "$GITHUB_PACKAGE_READ_TOKEN" > "$TOKEN_FILE"

# Build with GitHub token as build secret using temporary file
if ! $CONTAINER_RUNTIME build --no-cache --secret id=github_token,src="$TOKEN_FILE" -t "$IMAGE_TAG" .; then
    rm -f "$TOKEN_FILE"
    echo "❌ ERROR: Container build failed"
    exit 1
fi

# Clean up the temporary file
rm -f "$TOKEN_FILE"
echo "✅ Container build successful"

# Run security scan
echo "🔍 Running Trivy security scan..."
echo "Command: trivy image --cache-backend memory --severity $SEVERITY --format $SCAN_FORMAT --exit-code 1 $IMAGE_TAG"
echo ""

if ! trivy image --cache-backend memory --severity "$SEVERITY" --format "$SCAN_FORMAT" --exit-code 1 "$IMAGE_TAG"; then
    echo ""
    echo "❌ ERROR: Security scan found vulnerabilities of severity: $SEVERITY"
    echo ""
    echo "To see all vulnerabilities (including lower severity):"
    echo "  SEVERITY=LOW,MEDIUM,HIGH,CRITICAL $0"
    echo ""
    echo "To scan with different format:"
    echo "  SCAN_FORMAT=json $0"
    echo ""
    echo "To clear Trivy cache:"
    echo "  trivy clean --all"
    exit 1
fi

echo ""
echo "🎉 Security scan completed successfully!"
echo "✅ No vulnerabilities found of severity: $SEVERITY"
echo ""
echo "Image ready: $IMAGE_TAG"