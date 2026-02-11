# Contributing Guidelines

## Branch and PR Workflow

1. Create a branch from `main`
2. Make changes for one song (or one focused update)
3. Commit with clear messages, e.g.:
   - `Add baseline arrangement for runaround-sue`
   - `Fix tenor rhythm in mm. 42-48 for valerie`
4. Open a pull request
5. Wait for review and CI checks

## Required Files Per Song

Each song folder must include:

- One MuseScore source file (`.mscz`) in `source/`
- One PDF in `exports/`

Example:

```text
songs/valerie/
  source/valerie.mscz
  exports/valerie.pdf
```

You can scaffold the folder quickly with:

```bash
bash scripts/new_song.sh valerie
```

## Optional But Recommended

- Add `notes/changelog.md` with:
  - arranger
  - voice-part notes
  - date of musical changes
  - copyright/rights notes

## Review Checklist

- PDF matches latest `.mscz` content
- Voice parts and rehearsal markings are readable
- Song catalog row in `songs/README.md` is updated
