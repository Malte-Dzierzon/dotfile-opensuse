# AGENTS.md — xealom openSUSE Tumbleweed Snapshot 2026-10-15

Repo `dotfile-opensuse` = Snapshot des live-Systems `xealom@linux`. Klonen, diese Datei lesen,
`apps/app-inventory.md` + `migration/opensuse.md` abarbeiten. Keine Websuche für Noctalia/Umbriel
nötig — alle Befehle stehen hier.

## Stack (fix)

Umbriel 0.1.0 + Noctalia v5.2.1 + noctalia-greeter (`/usr/local`) + greetd. Terminal foot
(default) + kitty/alacritty. Editor Zed + Neovim LazyVim. Browser Zen. Files nautilus.
PDF zathura. Notes Obsidian (flatpak). Shell fish + starship. Launcher Walker 2.17.2.
Agents: pi 0.73.1 + OMP 0.2.0 + opencode v2.0.26 (nur Upstream, nie Distro-Paket).

## Config-Karte (Repo → Ziel)

- `configs/desktop/umbriel/` → `~/.config/umbriel/` (alle .toml + shaders)
- `configs/desktop/noctalia/templates+palettes+plugins.json` → `~/.config/noctalia/`;
  `settings-live.toml` ist Referenz für `~/.local/state/noctalia/settings.toml` (diffen, nicht blind überschreiben)
- `configs/desktop/gtk/3.0+4.0` → `~/.config/gtk-3.0`, `~/.config/gtk-4.0`;
  `configs/desktop/qt/qt5ct+qt6ct` → `~/.config/qt5ct`, `~/.config/qt6ct`
- `configs/desktop/mimeapps-live.list` → `~/.config/mimeapps.list`;
  `system/scripts/default-app` → `~/.local/bin/default-app` (6 Rollen: foot/zeditor/zen/nautilus/zathura/obsidian)
- `configs/desktop/launcher-overrides/*.desktop` → `~/.local/share/applications/`,
  danach `update-desktop-database ~/.local/share/applications` (versteckt Foot-Duplikate,
  Noctalia, YaST-Extras u.a. — sauberer Launcher)
- `configs/desktop/walker+mpd+kew+rmpc+swaylock` → `~/.config/<gleich>`
- `configs/shell/fish/` → `~/.config/fish/` (inkl. `conf.d/xealom-commands.fish`: 11 Wartungsfunktionen);
  `starship/starship.toml` → `~/.config/starship.toml`;
  `foot+kitty+alacritty+tmux+btop+cava+fastfetch` → `~/.config/<gleich>`
- `configs/development/nvim+zed+yazi+lazygit` → `~/.config/<gleich>`
- `configs/ai/omp` → `~/.config/omp`; `configs/ai/pi-agent/settings.json+themes` → `~/.pi/agent/`
  (auth.json/sessions NIE versioniert); `configs/ai/opencode/` = Referenz (jsonc + package.json)
- `configs/gaming/opentabletdriver-settings.json` → `~/.config/OpenTabletDriver/settings.json`;
  `configs/gaming/prism/prismlauncher.cfg` → `~/.local/share/PrismLauncher/` (JavaPath prüfen)
- `configs/creative/blender+inkscape+godot+krita` → `~/.config/<gleich>`
- `system/scripts/start-umbriel` → `~/.local/bin/start-umbriel`;
  GDM-Session `/usr/share/wayland-sessions/umbriel.desktop` zeigt auf diesen Starter
- `system/hardware/*.rules` → `/etc/udev/rules.d/` (Tablet); `system/services/` = Dienste-Notizen

## Installieren (Reihenfolge einhalten)

1. Zypper-Block aus `apps/app-inventory.md` (eine Zeile), dann
   `flatpak install --user -y flathub md.obsidian.Obsidian org.prismlauncher.PrismLauncher`.
2. Upstream:
   - Zen: Tarball-Script nach `docs.zen-browser.app/guides/install-linux` → `~/.local/bin/zen`
   - Zed: `curl -f https://zed.dev/install.sh | sh` → Symlinks `~/.local/bin/zed`, `zeditor`
   - Walker: Release-Binary `github.com/abenz1267/walker` → `~/.local/bin/walker`
   - pi: `npm i -g @mariozechner/pi-coding-agent` (scoped beachten)
   - OMP: `pi install npm:oh-my-pi` (Pi-Paketmanager, NICHT npm-global)
   - opencode: `curl -fsSL https://opencode.ai/install | bash`
   - OTD: `opentabletdriver-0.6.7-1.x86_64.rpm` mit `sudo rpm -i --nodeps` + user-dotnet 8.0.32
3. Umbriel/Noctalia/Greeter aus Source (`~/src/`):
   - Umbriel: `meson setup build --buildtype=release --prefix=$HOME/.local -Dtests=disabled --reconfigure && meson compile -C build && meson install -C build`
   - Noctalia: `just configure release "$HOME/.local" && just build release && just install release`
   - Greeter: `meson setup build-release --buildtype=release --reconfigure && meson compile -C build-release`, dann per sudo `meson install -C build-release && ./scripts/setup_greeter_system.sh`
   - `umbriel.service`-Units nach `~/.config/systemd/user/` symlinken; Greeter-Config via
     `/usr/local/bin/noctalia-greeter-print-greetd-config` nach `/etc/greetd/config.toml`
4. Configs per Karte kopieren, Launcher-Overrides + `update-desktop-database` nicht vergessen.
5. Nur was in `apps/app-inventory.md` unter „installiert“ steht. `ghostty/cliamp/sonora/toofan/slipper/rofi/osu`
  sind aus dem Repo gelöscht — NICHT nachinstallieren.

## Maschine (anpassen, nie blind kopieren)

User `xealom`, `monitors.toml` via `umbriel msg outputs` neu erkennen, Tablet-Offset verifizieren,
Prism-`JavaPath` auf `/usr/bin/java` prüfen, Locale de-DE, Tastatur US. Keine UUIDs/Secrets im Repo
(`auth.json`, `sessions/`, `node_modules`, Vaults, Profile, Realm-DBs sind ignoriert).

## Validieren

`umbriel --check`, `foot --version`, `nvim --headless +q`, `noctalia msg plugins list`
(umbriel-companion/theme-switcher/github-kanban enabled), `otd-daemon`-Status, Audio-Test,
Greeter-Login in Umbriel-Session.

## Freigabe nötig

Paket-Installs, Service-Enables, udev-Regeln, Greeter-/GDM-Umschaltung, Auth/Credentials
(`pi` → `/login`, `tailscale up`, SSH/Signatur-Keys, Game-Logins — nichts davon im Repo),
Überschreiben vorhandener User-Configs.
