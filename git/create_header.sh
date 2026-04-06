#!/bin/bash


cat <<'EOF'

#################################################################################
# Dynamic Header Generator for Bash Scripts
#################################################################################

With this script, you can easily add a dynamic header to all your bash scripts in a specified directory. 
The header includes the script's title base on the filename: 
*  description 
*  author information
*  GitHub link
*  last modified date

This is especially useful for maintaining consistency and providing essential information about your scripts at a glance.
Usage:
  ./create_header.sh [target_directory]
  Example:
  /usr/local/bin/create_header.sh /path/to/your/scripts
If no target directory is specified, it will default to the script's own directory.

Thanks to Aviel Amitay for creating this useful tool to enhance script documentation and organization!
GitHub: https://github.com/Aviel-Amitay


## Note: This script will skip files that already contain a header.

#############################################################################






EOF

################################################################################
# Add Dynamic Header to scripts
################################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-$SCRIPT_DIR}"
DATE="$(date '+%b %d %Y')"
DEFAULT_GITHUB_USER="Aviel-Amitay"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "[ERROR] Directory not found: $TARGET_DIR"
    echo "Usage: $(basename "$0") [target_directory]"
    exit 1
fi

echo "[INFO] Script location : $SCRIPT_DIR"
echo "[INFO] Scanning directory: $TARGET_DIR"

resolve_github_url() {
    local file_dir git_root remote_url repo_name github_url

    file_dir="$(cd "$(dirname "$1")" && pwd)"
    git_root="$(git -C "$file_dir" rev-parse --show-toplevel 2>/dev/null)"

    if [[ -n "$git_root" ]]; then
        remote_url="$(git -C "$git_root" config --get remote.origin.url 2>/dev/null)"

        if [[ -n "$remote_url" ]]; then
            github_url="$(printf '%s\n' "$remote_url" | sed -E \
                -e 's#^git@github\.com:#https://github.com/#' \
                -e 's#^ssh://git@github\.com/#https://github.com/#' \
                -e 's#\.git$##')"

            printf '%s\n' "$github_url"
            return
        fi

        repo_name="$(basename "$git_root")"
        printf 'https://github.com/%s/%s\n' "$DEFAULT_GITHUB_USER" "$repo_name"
        return
    fi

    repo_name="$(basename "$TARGET_DIR")"
    printf 'https://github.com/%s/%s\n' "$DEFAULT_GITHUB_USER" "$repo_name"
}

find "$TARGET_DIR" -type f -name "*.sh" | while read -r file; do
    echo "[INFO] Processing: $file"

    # Skip if already has header
    if grep -q "# Description:" "$file"; then
        echo "[SKIP] Header already exists"
        continue
    fi

    # Extract script name
    script_name=$(basename "$file")

    # Generate title from filename
    # Example: manage_ec2_instance.sh → Manage Ec2 Instance
    title=$(echo "$script_name" | sed 's/.sh//' | tr '_' ' ' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')

    # Auto description
    description="Automation script for '$script_name'"
    github_url="$(resolve_github_url "$file")"

    HEADER=$(cat <<EOF
################################################################################
# $title
# Description: $description
# Author : Aviel Amitay
# GitHub : $github_url
# Modified: $DATE
################################################################################


EOF
)

    tmp_file=$(mktemp)

    if head -n 1 "$file" | grep -qE '^#!/(usr/bin/env bash|bin/bash)$'; then
        {
            head -n 1 "$file"
            echo
            printf "%s" "$HEADER"
            echo
            echo
            echo
            tail -n +2 "$file"
        } > "$tmp_file"
    else
        {
            printf "%s" "$HEADER"
            cat "$file"
        } > "$tmp_file"
    fi

    mv "$tmp_file" "$file"

    echo "[OK] Header added"
done

echo "[DONE]"
