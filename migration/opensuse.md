# openSUSE Tumbleweed Neuaufbau (neue SSD) — 2026-10-15

Repo klonen nach `~/dotfile-opensuse`, dann `AGENTS.md` + `apps/app-inventory.md` folgen.
Alle Befehle für Umbriel/Noctalia/Greeter stehen in `AGENTS.md`.

1. Tumbleweed minimal + Wayland-Base installieren, User `xealom`, de-DE, Europe/Berlin, US-Tastatur.
   `sudo zypper dup`, dann `vulkaninfo | grep AMD` prüfen.
2. Zypper-Block aus `apps/app-inventory.md` installieren (eine Zeile) + 2 Flatpaks `--user`.
3. Upstream: Zen, Zed, Walker, pi (`@mariozechner/pi-coding-agent`), OMP (`pi install npm:oh-my-pi`),
   opencode, OTD-RPM + user-dotnet (Details `AGENTS.md`).
4. Umbriel/Noctalia/Greeter nach `~/src/` klonen (`noctalia-dev`-Org) und bauen wie in `AGENTS.md`.
   `start-umbriel` → `~/.local/bin/`, GDM-Session anlegen, `umbriel.service` symlinken, Login testen.
5. Configs per `AGENTS.md`-Karte kopieren. Noctalia-`settings-live.toml` nur diffen.
   Launcher-Overrides kopieren + `update-desktop-database`. `mimeapps.list` + `default-app` setzen.
6. Per TTY: Greeter-Config drucken (`noctalia-greeter-print-greetd-config`), nach
   `/etc/greetd/config.toml`, `gdm` disablen, `greetd` enablen, rebooten. Erst danach GDM entfernen.
7. Tablet: udev-Regel setzen, `uinput` laden, `otd-daemon` enablen, XP-Pen-Fläche prüfen.
   Prism-`JavaPath` fixen. `pi` → `/login` manuell. `tailscale up` manuell.
8. Validieren: `umbriel --check`, `nvim --headless +q`, Plugins enabled, Audio, Greeter-Login.
9. Kein De-Bloat nötig bei Minimal-Install. Nur falls Voll-Install: LibreOffice/Firefox/Games-Block
   entfernen, aber `nautilus` danach nachinstallieren (wird als Pattern-Dep mitgerissen).
