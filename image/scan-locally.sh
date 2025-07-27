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

# Clean existing builds
echo "🧹 Cleaning existing builds..."
if [[ -f "./clean.sh" ]]; then
    ./clean.sh
else
    echo "⚠️  Warning: clean.sh not found, skipping cleanup"
fi

# Build the container
echo "🔨 Building container image: $IMAGE_TAG"
if ! $CONTAINER_RUNTIME build -t "$IMAGE_TAG" .; then
    echo "❌ ERROR: Container build failed"
    exit 1
fi
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