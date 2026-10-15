# Ghostty-Setup (Standard-Terminal)

Ziel: `~/.config/ghostty/` = `config` + `themes/noctalia` (beide hier versioniert).

## Dateien hier

- `config` — Foot-Look (Maple Mono 14, Padding 10, Opacity 0.9, Scrollback 10000,
  Block-Cursor blinkend) + Cursor-Trail (Kitty-Physik-Port, siehe unten).
  Keine Farben hier — Palette kommt aus `theme = noctalia`.
- `themes/noctalia` — von Noctalia generiert (Template `ghostty`,
  `~/.local/state/noctalia/settings.toml` → `theme.templates.builtin_ids`
  muss `"ghostty"` enthalten). Referenzkopie; live wird sie von Noctalia
  via `noctalia msg templates-apply` neu geschrieben.

## Nach dem Kopieren noch nötig (keine Config-Dateien)

1. Shader klonen (in `config` per `custom-shader` referenziert):
   `git clone --depth 1 https://github.com/sahaj-b/ghostty-cursor-shaders ~/.config/ghostty/shaders`
   Aktiv ist `shaders/ghostty/cursor_trail_kitty_physics.glsl` (Port von Kittys
   Trail-Physik). Alternativen im selben Repo: `cursor_warp.glsl` (Schweif),
   `smooth_cursor_movement.glsl` (echtes Gleiten). Nur EIN Trail-Shader gleichzeitig.
2. Fonts: siehe `../desktop/fonts/installed-fonts.txt` (Maple Mono + fc-cache).
3. Als Standard setzen: `default-app --set terminal ghostty`
   (`default-app` übersetzt Foot-Flags `-a`/`-T` automatisch).
4. Prüfen: `ghostty +validate-config` (muss still sein), dann Ghostty neu laden.
