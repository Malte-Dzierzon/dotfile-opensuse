# dotfile-opensuse — Snapshot 2026-10-15

openSUSE-Tumbleweed-Setup von `xealom`, Stand wie live eingerichtet (Umbriel 0.1.0 +
Noctalia v5.2.1 + Greeter, Walker, Zen, Zed, Pi/OMP/opencode, OTD, Flatpaks
Obsidian/Prism/Sonora/Equibop/osu!lazer).

Start: **AGENTS.md** (Agent-Anleitung, keine Websuche nötig), dann **docs/fresh-install.md**,
Apps: **apps/app-inventory.md**.

```text
configs/      live-Configs (Ziele in AGENTS.md)
  desktop/    umbriel, noctalia, gtk, qt, mimeapps, walker, mpd/kew/rmpc, launcher-overrides
  shell/      fish (inkl. conf.d), starship, foot, kitty, alacritty, tmux, btop…
  development/ nvim, zed, yazi, lazygit
  ai/         omp, pi-agent (ohne Secrets), opencode-Ref
  gaming/     OTD-Profil, prism-cfg
  creative/   blender, inkscape, godot, krita
system/       packages.md, hardware/ (udev), services/, scripts/ (default-app, start-umbriel,
              xdg-su, yast-root, update-limine), sudoers.d/, root-qt5ct/, wayland-sessions/,
              boot/limine/
docs/         fresh-install.md (SSD-Checkliste), coverage.md (Abdeckung), bootstrap-opencode.sh
apps/         app-inventory.md (alleinige App-Wahrheit)
```
