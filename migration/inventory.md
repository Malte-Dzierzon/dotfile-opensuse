# Inventory — Snapshot 2026-10-15

## Archiviert (live, getestet)

Umbriel (alle TOML + shaders, live), Noctalia-Templates/Paletten/plugins.json + settings-live-Referenz,
GTK3/4, qt5ct/qt6ct, mimeapps-live, Walker, mpd/kew/rmpc, swaylock, rofi-Ref, fish inkl.
`conf.d/xealom-commands.fish` (11 Funktionen), starship, foot/kitty/alacritty, tmux, btop/cava/fastfetch,
nvim LazyVim, zed, yazi, lazygit, omp, pi-agent (settings+themes, ohne auth/sessions), opencode-Ref,
OTD-XP-Pen-Settings, Prism-cfg, Blender/Inkscape/Godot/Krita-Settings, `default-app` + `start-umbriel`,
`launcher-overrides/` (15 .desktop NoDisplay-Einträge = sauberer Launcher), udev-Regeln, Paket-/Dienst-Doku.

## Manuell (nicht portabel)

`pi` → `/login`, Zen-Profil, Obsidian-Vault, Prism-Spieldaten, OTD-Area-Feinabgleich,
`monitors.toml`-Namen (neu erkennen), Tablet-Offset, SSH/Signatur-Keys, `tailscale up`,
Game-Logins, LMStudio-Modelle (nicht installiert).

## Ausgeschlossen (Secrets/State)

`~/.pi/agent/auth.json`, `sessions/`, `~/.config/opencode/node_modules+service.json`,
Browser-Profile, Vaults, Realm-DBs, Flatpak-`~/.var`, Caches, Machine-IDs, Hardware-UUIDs.
`.gitignore` deckt das ab.

## App-Liste

Alleinige Wahrheit: `apps/app-inventory.md` (installiert vs. nicht installiert, mit Quellen).
NixOS-Katalog-Leichen (nil/alejandra/nh, ghostty-Binary, cliamp/sonora/toofan/slipper-Binaries,
bw/lms/headsetcontrol/lazydocker/osu/Flare/Concord/Readest/Serein) werden NICHT mitinstalliert.
