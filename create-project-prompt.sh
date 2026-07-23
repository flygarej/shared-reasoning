#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage: $0 <project>"
    exit 1
}

[[ $# -eq 1 ]] || usage

project="$1"

repo_dir="$(cd "$(dirname "$0")" && pwd)"

project_dir="$repo_dir/projects/$project"

[[ -d "$project_dir" ]] || {
    echo "Project '$project' not found." >&2
    exit 1
}

outfile="$project_dir/$project.md"

files=(
    "$repo_dir/protocol.md"
    "$repo_dir/rationale.md"
)

{
    for f in "${files[@]}"; do
        [[ -f "$f" ]] || continue
        printf '<!-- %s -->\n\n' "${f#$repo_dir/}"
        cat "$f"
        printf '\n\n'
    done

    for dir in \
        "$repo_dir/projects/common" \
        "$project_dir/state" \
        "$project_dir/domain"
    do
        [[ -d "$dir" ]] || continue

        find "$dir" -maxdepth 1 -type f -name '*.md' \
            | sort \
            | while read -r f
            do
                printf '<!-- %s -->\n\n' "${f#$repo_dir/}"
                cat "$f"
                printf '\n\n'
            done
    done
} > "$outfile"

echo "Created $outfile"
