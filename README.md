# Brown Derbies Sheet Music Library

Central source of truth for Brown Derbies arrangements.

This repository keeps each song's MuseScore source (`.mscz`) paired with a matching performance-ready PDF (`.pdf`) so anyone can always grab the latest version from `main`.

## Quick Access

- Latest library: this repo's `main` branch
- Song catalog: [`songs/README.md`](songs/README.md)
- Song template: [`songs/_TEMPLATE/`](songs/_TEMPLATE/)

## Repository Structure

```text
songs/
  _TEMPLATE/
  song-title-slug/
    source/
      song-title-slug.mscz
    exports/
      song-title-slug.pdf
    notes/
      changelog.md
```

## Add or Update a Song

1. Create a branch: `song/<title-or-change>`
2. Create folder scaffolding: `bash scripts/new_song.sh <song-title-slug>` (or add/update an existing folder)
3. Ensure both files exist:
   - `source/<slug>.mscz`
   - `exports/<slug>.pdf`
4. Update `songs/README.md` with the song entry
5. Open a pull request

CI will fail if any song is missing either the `.mscz` or `.pdf` pair.

## Naming Rules

- Use lowercase kebab-case folder names: `dont-stop-believin`
- Keep base file names aligned with folder slug when possible
- One arrangement per song folder (create a new folder for major alternate versions)

## Rights and Licensing

Only upload arrangements and source materials you have the legal right to store and share with members.

Add rights notes for each song in `notes/changelog.md` or another file under `notes/`.
