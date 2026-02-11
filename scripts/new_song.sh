#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <song-slug>"
  exit 1
fi

slug="$1"

if [[ ! "$slug" =~ ^[a-z0-9-]+$ ]]; then
  echo "Error: slug must be lowercase kebab-case (a-z, 0-9, -)."
  exit 1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
song_dir="$repo_root/songs/$slug"

if [[ -d "$song_dir" ]]; then
  echo "Error: songs/$slug already exists"
  exit 1
fi

mkdir -p "$song_dir/source" "$song_dir/exports" "$song_dir/notes"

cat > "$song_dir/notes/changelog.md" <<EON
# Changelog

- $(date +%Y-%m-%d): Initial song folder created

## Rights Note

- Original work:
- Arranger:
- Permission basis:
- Restrictions:
EON

echo "Created songs/$slug"
echo "Next: add source/$slug.mscz and exports/$slug.pdf"
