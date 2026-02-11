#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

pick_musescore_cmd() {
  for cmd in musescore mscore musescore4; do
    if command -v "$cmd" >/dev/null 2>&1; then
      echo "$cmd"
      return 0
    fi
  done
  return 1
}

if ! MSCORE_CMD="$(pick_musescore_cmd)"; then
  echo "ERROR: MuseScore CLI not found. Install MuseScore and ensure 'musescore' or 'mscore' is in PATH."
  exit 1
fi

rendered=0
while IFS= read -r -d '' mscz_file; do
  pdf_file="${mscz_file%.mscz}.pdf"
  "$MSCORE_CMD" -o "$pdf_file" "$mscz_file"
  echo "Rendered: $pdf_file"
  rendered=$((rendered + 1))
done < <(find "$ROOT_DIR/songs" -mindepth 2 -maxdepth 2 -type f -name '*.mscz' -print0)

if [[ "$rendered" -eq 0 ]]; then
  echo "No .mscz files found in songs/<slug>/"
else
  echo "Done. Rendered $rendered PDF file(s)."
fi
