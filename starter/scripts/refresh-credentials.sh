#!/bin/bash
################################################################################
# AWS Credential Refresh Script
#
# Purpose: Automate AWS Bedrock credential refresh and dev container rebuild
# Target: Host machine (macOS/Linux)
# Scope: CUI projects using AWS Bedrock with dev containers
#
# This script handles the complete lifecycle of updating AWS credentials:
# 1. Stop existing dev containers
# 2. Refresh AWS SSO credentials
# 3. Export credentials to .env.bedrock
# 4. Rebuild dev containers with new credentials
# 5. Access the container (CLI exec or VS Code)
#
# Usage: Run from host machine (outside container):
#   ./scripts/refresh-credentials.sh [OPTIONS]
#
# Options:
#   --vscode    Open VS Code after rebuild (instead of exec into container)
#   --help      Show this help message
#
# Requirements:
# - AWS CLI with configured claude-bedrock profile
# - DevContainer CLI (@devcontainers/cli)
# - Podman running
# - Git repository
#
################################################################################

set -euo pipefail  # Exit on error, undefined variables, pipe failures

################################################################################
# CONSTANTS & CONFIGURATION
################################################################################

readonly AWS_PROFILE="claude-bedrock"
readonly COMPOSE_FILE=".devcontainer/docker-compose.firewall.yml"
readonly ENV_FILE=".env.bedrock"

# Auto-detected from docker-compose file at runtime
FIREWALL_CONTAINER=""
AI_CONTAINER=""

# Mode: "cli" (default) or "vscode"
MODE="cli"

# Color codes for output
readonly COLOR_RESET='\033[0m'
readonly COLOR_GREEN='\033[0;32m'
readonly COLOR_YELLOW='\033[1;33m'
readonly COLOR_RED='\033[0;31m'
readonly COLOR_CYAN='\033[0;36m'

################################################################################
# USAGE & ARGUMENT PARSING
################################################################################

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Refresh AWS Bedrock credentials and rebuild dev containers for CUI projects.

OPTIONS:
    --vscode    After rebuilding, open VS Code instead of exec'ing into container.
                Use this if you develop with VS Code's "Reopen in Container" feature.
    --help      Show this help message and exit.

EXAMPLES:
    # Default: rebuild and exec into container (for devcontainer CLI users)
    $(basename "$0")

    # For VS Code users: rebuild and open VS Code
    $(basename "$0") --vscode

REQUIREMENTS:
    - AWS CLI with configured 'claude-bedrock' profile
    - DevContainer CLI (@devcontainers/cli)
    - Podman running
    - Git repository with .devcontainer/docker-compose.firewall.yml

EOF
    exit 0
}

parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --vscode)
                MODE="vscode"
                shift
                ;;
            --help|-h)
                usage
                ;;
            *)
                echo "Unknown option: $1"
                echo "Use --help for usage information."
                exit 1
                ;;
        esac
    done
}

################################################################################
# CONTAINER NAME DETECTION
################################################################################

# Parse container_name from docker-compose file for a given service
# Args: $1 = compose file path, $2 = service name
# Returns: container_name value or empty string if not found
parse_container_name() {
    local compose_file=$1
    local service_name=$2

    awk -v service="${service_name}" '
        # Track if we are inside the target service block
        $0 ~ "^[[:space:]]*" service ":" { in_service=1; next }

        # Exit service block when we hit another service or end of services section
        in_service && /^[[:space:]]*[a-zA-Z_-]+:/ && !/^[[:space:]]+/ { in_service=0 }

        # Extract container_name when inside the service block
        in_service && /^[[:space:]]+container_name:/ {
            # Remove leading whitespace and "container_name:"
            sub(/^[[:space:]]+container_name:[[:space:]]*/, "")
            # Remove quotes if present
            gsub(/["'\'']/, "")
            print $0
            exit
        }
    ' "${compose_file}"
}

# Detect container names from docker-compose file
# Args: $1 = compose file path
# Sets: FIREWALL_CONTAINER and AI_CONTAINER globals
detect_container_names() {
    local compose_file=$1

    if [[ ! -f "${compose_file}" ]]; then
        log_error "Compose file not found: ${compose_file}"
        exit 1
    fi

    log_info "Detecting container names from ${compose_file}"

    FIREWALL_CONTAINER=$(parse_container_name "${compose_file}" "firewall-manager")
    AI_CONTAINER=$(parse_container_name "${compose_file}" "ai-assistant")

    if [[ -z "${FIREWALL_CONTAINER}" ]]; then
        log_error "Failed to detect firewall-manager container name from ${compose_file}"
        log_error "Ensure the compose file has a 'firewall-manager' service with 'container_name' defined"
        exit 1
    fi

    if [[ -z "${AI_CONTAINER}" ]]; then
        log_error "Failed to detect ai-assistant container name from ${compose_file}"
        log_error "Ensure the compose file has an 'ai-assistant' service with 'container_name' defined"
        exit 1
    fi

    log_info "Detected firewall container: ${FIREWALL_CONTAINER}"
    log_info "Detected ai-assistant container: ${AI_CONTAINER}"
}

# Extract container name prefix (e.g., "my-project" from "my-project-firewall-manager")
# Args: $1 = container name
# Returns: project prefix with known service suffixes removed
get_container_prefix() {
    local container_name=$1
    # Remove known service suffixes to get full project prefix
    # Handles multi-word prefixes with dashes (e.g., "my-project")
    echo "${container_name}" | sed -E 's/-(firewall-manager|ai-assistant)$//'
}

################################################################################
# LOGGING FUNCTIONS
################################################################################

log_info() {
    echo -e "${COLOR_GREEN}[INFO]${COLOR_RESET} $*"
}

log_warn() {
    echo -e "${COLOR_YELLOW}[WARN]${COLOR_RESET} $*"
}

log_error() {
    echo -e "${COLOR_RED}[ERROR]${COLOR_RESET} $*"
}

log_step() {
    echo ""
    echo -e "${COLOR_GREEN}==>${COLOR_RESET} $*"
    echo ""
}

################################################################################
# ERROR HANDLING
################################################################################

cleanup_on_error() {
    local exit_code=$?
    local line_number=$1

    log_error "Script failed at line ${line_number} with exit code ${exit_code}"
    log_error "Please check the error message above for details"

    exit "${exit_code}"
}

trap 'cleanup_on_error ${LINENO}' ERR

################################################################################
# VALIDATION FUNCTIONS
################################################################################

validate_prerequisites() {
    log_step "Phase 1: Validating prerequisites"

    # Check if we're in a git repository
    if ! git rev-parse --git-dir &>/dev/null; then
        log_error "Not a git repository"
        log_error "Please run this script from within the project directory"
        exit 1
    fi

    log_info "Git repository: OK"

    # Check AWS CLI
    if ! command -v aws &>/dev/null; then
        log_error "AWS CLI not found"
        log_error "Install with: brew install awscli"
        exit 1
    fi

    log_info "AWS CLI: $(aws --version 2>&1 | head -n1)"

    # Check DevContainer CLI
    if ! command -v devcontainer &>/dev/null; then
        log_error "DevContainer CLI not found"
        log_error "Install with: brew install devcontainer"
        exit 1
    fi

    log_info "DevContainer CLI: $(devcontainer --version)"

    # Check Podman
    if ! command -v podman &>/dev/null; then
        log_error "Podman not found"
        log_error "Install with: brew install podman"
        exit 1
    fi

    log_info "Podman: $(podman --version)"

    log_info "All prerequisites validated"
}

find_project_root() {
    local project_root
    project_root=$(git rev-parse --show-toplevel)

    if [[ -z "${project_root}" ]]; then
        log_error "Failed to determine project root"
        exit 1
    fi

    echo "${project_root}"
}

################################################################################
# CONTAINER MANAGEMENT
################################################################################

stop_and_remove_containers() {
    log_step "Phase 2: Stopping and removing dev containers"

    # Get container prefix for grep pattern matching
    local prefix
    prefix=$(get_container_prefix "${FIREWALL_CONTAINER}")

    log_info "Stopping ai-assistant and firewall containers..."
    log_info "Note: Named volumes will be preserved"

    # Stop containers in order: ai-assistant first, then firewall
    # This ensures ai-assistant is always stopped before or at the same time as firewall
    podman stop "${AI_CONTAINER}" "${FIREWALL_CONTAINER}" 2>/dev/null || log_warn "Failed to stop some containers (continuing anyway)"

    log_info "Removing ai-assistant and firewall containers..."
    # Remove containers in the same order
    podman rm "${AI_CONTAINER}" "${FIREWALL_CONTAINER}" 2>/dev/null || log_warn "Failed to remove some containers (continuing anyway)"

    log_info "Checking for any remaining ${prefix} containers..."

    # Get list of any other project-related containers
    local containers
    containers=$(podman ps -a --format "{{.Names}}" | grep "^${prefix}-" || true)

    if [[ -n "${containers}" ]]; then
        log_warn "Found additional ${prefix} containers:"
        while IFS= read -r container; do
            log_info "Removing container: ${container}"
            podman rm -f "${container}" 2>/dev/null || log_warn "Failed to remove ${container} (may already be removed)"
        done <<< "${containers}"
        log_info "All ${prefix} containers removed"
    else
        log_info "No additional ${prefix} containers found"
    fi
}

################################################################################
# AWS CREDENTIAL MANAGEMENT
################################################################################

refresh_aws_credentials() {
    log_step "Phase 3: Refreshing AWS credentials"

    # Logout first to clear cached credentials
    log_info "Logging out of AWS SSO (profile: ${AWS_PROFILE})"
    if ! aws sso logout --profile "${AWS_PROFILE}" 2>/dev/null; then
        log_warn "Logout failed or no active session (continuing anyway)"
    else
        log_info "Logged out successfully"
    fi

    log_info "Logging in to AWS SSO (profile: ${AWS_PROFILE})"
    log_info "This will open your browser for authentication"

    # Run AWS SSO login - this is blocking and will wait for user to complete auth
    if ! aws sso login --profile "${AWS_PROFILE}"; then
        log_error "AWS SSO login failed or was cancelled"
        log_error "Please complete the browser authentication and try again"
        exit 1
    fi

    log_info "AWS SSO login successful"

    # Verify login succeeded by checking caller identity
    log_info "Verifying AWS credentials..."
    if ! aws sts get-caller-identity --profile "${AWS_PROFILE}" &>/dev/null; then
        log_error "Failed to verify AWS credentials"
        log_error "Please check your AWS configuration"
        exit 1
    fi

    log_info "AWS credentials verified"

    # Export credentials to .env.bedrock with restrictive permissions
    log_info "Exporting credentials to ${ENV_FILE}"

    # Set restrictive umask before creating credentials file (600 = owner read/write only)
    local old_umask
    old_umask=$(umask)
    umask 077

    if ! aws configure export-credentials --profile "${AWS_PROFILE}" --format env-no-export > "${ENV_FILE}"; then
        umask "${old_umask}"
        log_error "Failed to export credentials to ${ENV_FILE}"
        log_error "Please check AWS CLI configuration"
        exit 1
    fi

    # Restore original umask
    umask "${old_umask}"

    # Verify the file was created and is non-empty
    if [[ ! -s "${ENV_FILE}" ]]; then
        log_error "${ENV_FILE} is empty or does not exist"
        exit 1
    fi

    log_info "Credentials exported successfully to ${ENV_FILE}"

    # Display credential expiration if available
    if grep -q "AWS_CREDENTIAL_EXPIRATION" "${ENV_FILE}"; then
        local expiration
        expiration=$(grep "AWS_CREDENTIAL_EXPIRATION" "${ENV_FILE}" | cut -d'=' -f2)
        log_info "Credentials expire at: ${expiration}"
    fi
}

################################################################################
# CONTAINER REBUILD
################################################################################

rebuild_containers() {
    log_step "Phase 4: Rebuilding dev containers"

    # Get container prefix for grep pattern matching
    local prefix
    prefix=$(get_container_prefix "${FIREWALL_CONTAINER}")

    log_info "Starting devcontainer rebuild..."
    log_info "This may take 2-5 minutes depending on cached layers"

    # Use devcontainer up to rebuild and start containers
    # Containers were already manually removed in Phase 2
    # This sources the new .env.bedrock file automatically
    if ! devcontainer up --workspace-folder .; then
        log_error "DevContainer rebuild failed"
        log_error "Check the error messages above"
        log_error "You may need to manually inspect the container logs"
        exit 1
    fi

    log_info "Containers rebuilt successfully"

    # Verify containers are running
    log_info "Verifying containers are running..."

    local running_containers
    running_containers=$(podman ps --format "{{.Names}}" | grep "^${prefix}-" || true)

    if [[ -z "${running_containers}" ]]; then
        log_error "No ${prefix} containers found running"
        log_error "Check container status with: podman ps -a"
        exit 1
    fi

    log_info "Running containers:"
    echo "${running_containers}" | while read -r container; do
        log_info "  - ${container}"
    done
}

################################################################################
# CONTAINER ACCESS
################################################################################

exec_into_container() {
    log_step "Phase 5: Accessing container"

    log_info "Waiting for container to be ready..."

    local max_attempts=30
    local attempt=1

    while [[ ${attempt} -le ${max_attempts} ]]; do
        if podman ps --format "{{.Names}}" | grep -q "^${AI_CONTAINER}$"; then
            # Container exists, check if it's running
            local status
            status=$(podman inspect "${AI_CONTAINER}" --format "{{.State.Status}}" 2>/dev/null || echo "unknown")

            if [[ "${status}" == "running" ]]; then
                log_info "Container ${AI_CONTAINER} is ready (attempt ${attempt}/${max_attempts})"
                break
            fi
        fi

        if [[ ${attempt} -eq ${max_attempts} ]]; then
            log_error "Container ${AI_CONTAINER} failed to start after ${max_attempts} attempts"
            log_error "Check status with: podman ps -a"
            log_error "Check logs with: podman logs ${AI_CONTAINER}"
            exit 1
        fi

        log_info "Waiting for container... (attempt ${attempt}/${max_attempts})"
        sleep 1
        attempt=$((attempt + 1))
    done

    log_info "Executing shell in ${AI_CONTAINER} via devcontainer exec"
    log_info "This will respect devcontainer.json lifecycle hooks (e.g., postAttachCommand)"
    log_info "You will be dropped into an interactive bash session"
    echo ""

    # Use devcontainer exec to properly respect devcontainer.json configuration
    # This ensures postAttachCommand and other lifecycle hooks are executed
    exec devcontainer exec --workspace-folder . /bin/bash
}

open_in_vscode() {
    log_step "Phase 5: Opening VS Code"

    log_info "Waiting for container to be ready..."

    local max_attempts=30
    local attempt=1

    while [[ ${attempt} -le ${max_attempts} ]]; do
        if podman ps --format "{{.Names}}" | grep -q "^${AI_CONTAINER}$"; then
            # Container exists, check if it's running
            local status
            status=$(podman inspect "${AI_CONTAINER}" --format "{{.State.Status}}" 2>/dev/null || echo "unknown")

            if [[ "${status}" == "running" ]]; then
                log_info "Container ${AI_CONTAINER} is ready (attempt ${attempt}/${max_attempts})"
                break
            fi
        fi

        if [[ ${attempt} -eq ${max_attempts} ]]; then
            log_error "Container ${AI_CONTAINER} failed to start after ${max_attempts} attempts"
            log_error "Check status with: podman ps -a"
            log_error "Check logs with: podman logs ${AI_CONTAINER}"
            exit 1
        fi

        log_info "Waiting for container... (attempt ${attempt}/${max_attempts})"
        sleep 1
        attempt=$((attempt + 1))
    done

    log_info "Opening VS Code..."

    # Check if VS Code is available
    if ! command -v code &>/dev/null; then
        log_warn "VS Code 'code' command not found in PATH"
        log_info "Please open VS Code manually and use 'Reopen in Container'"
    else
        code .
        log_info "VS Code opened"
    fi

    echo ""
    echo "╔═══════════════════════════════════════════════════════════╗"
    echo "║  Container is ready! Next steps:                          ║"
    echo "║                                                           ║"
    echo "║  1. In VS Code, press Cmd+Shift+P (Mac) or Ctrl+Shift+P   ║"
    echo "║  2. Type: 'Reopen in Container'                           ║"
    echo "║  3. Select it to attach to the running container          ║"
    echo "╚═══════════════════════════════════════════════════════════╝"
    echo ""

    log_info "Credential refresh complete!"
}

################################################################################
# MAIN EXECUTION
################################################################################

main() {
    # Parse command line arguments
    parse_args "$@"

    echo ""
    echo "╔═══════════════════════════════════════════════════════════╗"
    echo "║  AWS Credential Refresh & Container Rebuild               ║"
    echo "╚═══════════════════════════════════════════════════════════╝"
    echo ""

    log_info "Started at: $(date '+%Y-%m-%d %H:%M:%S')"
    log_info "Mode: ${MODE}"

    # Find and change to project root
    local project_root
    project_root=$(find_project_root)
    log_info "Project root: ${project_root}"

    cd "${project_root}" || {
        log_error "Failed to change to project root: ${project_root}"
        exit 1
    }

    # Detect container names from docker-compose file
    detect_container_names "${COMPOSE_FILE}"

    # Execute phases 1-4
    validate_prerequisites
    stop_and_remove_containers
    refresh_aws_credentials
    rebuild_containers

    # Phase 5: Access container based on mode
    if [[ "${MODE}" == "vscode" ]]; then
        open_in_vscode
    else
        exec_into_container
        # Note: exec_into_container uses 'exec' which replaces this process,
        # so execution never returns here
    fi
}

# Run main function
main "$@"
