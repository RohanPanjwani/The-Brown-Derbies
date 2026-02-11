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
    song-title-slug.mscz
    song-title-slug.pdf
    notes/
      changelog.md
```

## Add or Update a Song

1. Create a branch: `song/<title-or-change>`
2. Create folder scaffolding: `bash scripts/new_song.sh <song-title-slug>` (or add/update an existing folder)
3. Ensure both files exist:
   - `<slug>.mscz`
   - `<slug>.pdf`
4. Update `songs/README.md` with the song entry
5. Open a pull request

CI will fail if any song is missing either the `.mscz` or `.pdf` pair.

## Auto-Update PDFs From MSCZ

Yes, this can be automated.

This repo includes:

- `scripts/render_pdfs.sh`: renders PDFs for all `songs/<slug>/*.mscz`
- `.githooks/pre-commit`: auto-renders and stages matching PDFs when staged `.mscz` files change
- `.github/workflows/render-pdfs.yml`: GitHub Action to render PDFs from changed `.mscz` files for collaborators

Enable the hook once per clone:

```bash
git config core.hooksPath .githooks
```

Manual render command:

```bash
bash scripts/render_pdfs.sh
```

Note: this requires MuseScore CLI (`musescore` or `mscore`) installed on your machine.

In GitHub:

- On `push` with `.mscz` changes, the action renders PDFs and commits them back to the branch.
- On `pull_request` with `.mscz` changes, the action verifies PDFs are up to date before merge.

## Naming Rules

- Use lowercase kebab-case folder names: `dont-stop-believin`
- Keep base file names aligned with folder slug when possible
- One arrangement per song folder (create a new folder for major alternate versions)

## Rights and Licensing

Only upload arrangements and source materials you have the legal right to store and share with members.

Add rights notes for each song in `notes/changelog.md` or another file under `notes/`.
