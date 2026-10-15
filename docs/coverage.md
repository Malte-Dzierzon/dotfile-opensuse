# Coverage — Snapshot 2026-10-15

## Archiviert (live, getestet)

Umbriel (alle TOML + shaders, live), Noctalia-Templates/Paletten/plugins.json + settings-live-Referenz,
GTK3/4, qt5ct/qt6ct (+ Root-qt5ct unter `system/root-qt5ct/`), mimeapps-live, Walker, mpd/kew/rmpc,
swaylock, fish inkl. `conf.d/xealom-commands.fish`, starship, foot/ghostty, tmux, btop/cava/fastfetch,
nvim LazyVim, zed, yazi, lazygit, omp, pi-agent (settings+themes, ohne auth/sessions), opencode-Ref,
OTD-XP-Pen-Settings, Prism-cfg, Blender/Inkscape/Godot/Krita-Settings, `default-app` + `start-umbriel` +
`xdg-su`/`yast-root`/`update-limine`, `launcher-overrides/` (17 top-level + 13 YaST2 + Steam-Spiel),
sudoers-Regel, Limine-Doku, dconf-Dump, udev-Regeln, Paket-/Dienst-Doku.

## Manuell (nicht portabel)

`pi` → `/login`, Zen-Profil, Obsidian-Vault, Prism-Spieldaten, OTD-Area-Feinabgleich,
`monitors.toml`-Namen (neu erkennen), Tablet-Offset, SSH/Signatur-Keys, `tailscale up`,
Game-Logins, ESP/NVRAM (Limine-Eintrag neu anlegen, siehe `system/boot/limine/README.md`).

## Ausgeschlossen (Secrets/State)

`~/.pi/agent/auth.json`, `sessions/`, `~/.config/opencode/node_modules+service.json`,
Browser-Profile, Vaults, Realm-DBs, Flatpak-`~/.var`, Caches, Machine-IDs, Hardware-UUIDs.
`.gitignore` deckt das ab.

## App-Liste

Alleinige Wahrheit: `apps/app-inventory.md` (installiert vs. nicht installiert, mit Quellen).
