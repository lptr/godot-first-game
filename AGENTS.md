# Repository Guidelines

## Project Structure & Module Organization

- `scenes/`: Godot scenes (`.tscn`) for game, platform, coin, kill zones, player, and touch controls; `game.tscn` is the entry point.
- `scripts/`: GDScript logic per scene (e.g., `player.gd`, `touch_controls.gd`); keep scene ↔ script pairs aligned.
- `assets/`: Source art, audio, fonts, and sprite sheets; keep originals here and reference via `res://assets/...`.
- `.godot/`: Editor cache; never hand-edit. `export_presets.cfg` tracks the Web export.

## Build, Test, and Development Commands

- Open editor: `godot4 --editor --path .` (uses project settings from `project.godot`).
- Run game locally: `godot4 --path .` (uses `run/main_scene`), or press F5 inside the editor.
- Export Web build: `godot4 --headless --path . --export-release "Web" D:/Workspace/potyi/godot-first-game-web/index.html` (update the path if your checkout differs).

## Coding Style & Naming Conventions

- Language: GDScript 4.5 with static typing where possible; prefer `const` for tunables (e.g., `SPEED`).
- Indentation: Godot default tabs; no trailing whitespace; keep lines readable (~100 chars).
- Naming: snake_case for files and node names (`player.tscn`, `touch_controls.gd`); PascalCase for class names; ALL_CAPS for constants.
- Scene-script pairing: keep script filename matching its scene; attach scripts at the root node unless a subnode warrants its own script.
- Signals & input: prefer input actions (`ui_left`, `ui_right`, `ui_accept`) over hard-coded keys; document custom actions in `project.godot`.

## Testing Guidelines

- No automated test suite yet; rely on manual playtests.
- Quick loop: run `godot4 --path .` or press F5, verify movement, collision, coin pickup, and touch controls; watch the debugger for warnings.
- For physics changes, enable visible collisions in the editor (Debug → Visible Collision Shapes) and test with both keyboard and touch.

## Commit & Pull Request Guidelines

- Commits: small, focused, imperative subject lines (e.g., `Add touch controls overlay`, `Tweak player jump arc`); group related scene/script/asset updates together.
- PRs: describe gameplay impact, list touched scenes/scripts/assets, and note any export preset or input map changes. Include before/after screenshot or GIF for visual tweaks and a short manual test checklist.
- Keep `export_presets.cfg` changes intentional; note if you alter export paths or options so others can replicate builds.
