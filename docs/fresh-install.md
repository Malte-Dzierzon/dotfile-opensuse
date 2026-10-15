# openSUSE Tumbleweed Neuaufbau (neue SSD) — 2026-10-15

Repo klonen nach `~/dotfile-opensuse`, dann `AGENTS.md` + `apps/app-inventory.md` folgen.
Alle Befehle für Umbriel/Noctalia/Greeter stehen in `AGENTS.md`.
Kein NixOS mehr: das hier klont openSUSE → openSUSE.

1. Tumbleweed minimal + Wayland-Base installieren, User `xealom`, de-DE, Europe/Berlin, US-Tastatur.
   `sudo zypper dup`, dann `vulkaninfo | grep AMD` prüfen.
2. Zypper-Block aus `apps/app-inventory.md` installieren (eine Zeile) + 5 Flatpaks `--user`
   (Obsidian, Prism, Sonora, Equibop, osu!lazer — IDs in `AGENTS.md` Schritt 1).
3. Upstream: Zen, Zed, Walker, pi (`@mariozechner/pi-coding-agent`), OMP (`pi install npm:oh-my-pi`),
   opencode (`docs/bootstrap-opencode.sh`), OTD-RPM + user-dotnet (Details `AGENTS.md`).
4. Umbriel/Noctalia/Greeter nach `~/src/` klonen (`noctalia-dev`-Org) und bauen wie in `AGENTS.md`.
   `start-umbriel` → `~/.local/bin/`, GDM-Session aus `system/wayland-sessions/umbriel.desktop`
   anlegen, `umbriel.service` symlinken, Login testen.
5. Configs per `AGENTS.md`-Karte kopieren (`chmod +x` für `system/scripts/`).
   Noctalia-`settings-live.toml` nur diffen. Launcher-Overrides kopieren (inkl. `YaST2/`-Unterordner)
   + `update-desktop-database`. `mimeapps.list` + `default-app` setzen. dconf-Dump laden
   (`configs/desktop/dconf/README.md`).
6. YaST-Stack: `system/sudoers.d/` einrichten (Pflicht vor `yast-root`), Root-qt5ct nach
   `/root/.config/qt5ct/` (dunkles YaST) — Befehle in den jeweiligen READMEs.
7. Bootloader: YaST-Einstellung auf **systemd-boot lassen** (liefert BLS für Limine).
   Limine nach `system/boot/limine/README.md` einrichten (ESP, NVRAM, `update-limine`
   nach jedem Kernel-Update).
8. Per TTY: Greeter-Config drucken (`noctalia-greeter-print-greetd-config`), nach
   `/etc/greetd/config.toml`, `gdm` disablen, `greetd` enablen, rebooten. Erst danach GDM entfernen.
9. Tablet: udev-Regel setzen, `uinput` laden, `otd-daemon` enablen, XP-Pen-Fläche prüfen.
   Prism-`JavaPath` fixen. `pi` → `/login` manuell. `tailscale up` manuell.
10. Validieren: `umbriel --check`, `nvim --headless +q`, Plugins enabled, Audio, Greeter-Login,
    YaST ohne Prompt (`yast-root --list`), Limine-Menü beim Boot.
11. Kein De-Bloat nötig bei Minimal-Install. Nur falls Voll-Install: LibreOffice/Firefox/Games-Block
    entfernen, aber `nautilus` danach nachinstallieren (wird als Pattern-Dep mitgerissen).
