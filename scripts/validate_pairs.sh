#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SONGS_DIR="$ROOT_DIR/songs"

if [[ ! -d "$SONGS_DIR" ]]; then
  echo "songs/ directory not found"
  exit 1
fi

fail=0

while IFS= read -r -d '' song_dir; do
  name="$(basename "$song_dir")"

  if [[ "$name" == "_TEMPLATE" ]]; then
    continue
  fi

  has_mscz=0
  has_pdf=0

  if find "$song_dir/source" -maxdepth 1 -type f -name '*.mscz' 2>/dev/null | grep -q .; then
    has_mscz=1
  fi

  if find "$song_dir/exports" -maxdepth 1 -type f -name '*.pdf' 2>/dev/null | grep -q .; then
    has_pdf=1
  fi

  if [[ "$has_mscz" -eq 0 || "$has_pdf" -eq 0 ]]; then
    echo "ERROR: $name must include at least one .mscz in source/ and one .pdf in exports/"
    fail=1
  fi
done < <(find "$SONGS_DIR" -mindepth 1 -maxdepth 1 -type d -print0)

if [[ "$fail" -eq 1 ]]; then
  exit 1
fi

echo "Validation passed: every song has both .mscz and .pdf files."
