# App-Liste — alles Installierte, Stand 2026-10-15

Quelle: live-System `xealom@linux`. Reinstall-Block zuerst, darunter Vollnachweis
mit Versionen. Rohdumps: `apps/snapshot/` (`rpm-qa.txt` = alle 2918 rpm,
`zypper-versions.txt`, `upstream-versions.txt`, `flatpak-user.txt`, `npm-global.txt`,
`desktop-entries-effective.txt`).

## 1. Reinstall (ein Block, zypper)

```bash
sudo zypper install -y foot kitty alacritty fish starship tmux yazi lazygit btop fastfetch fzf eza zoxide neovim mpv zathura nautilus mpd rmpc kew wiremix cava steam gamemode mangohud docker tailscale nodejs24 blender inkscape krita godot grim slurp swaylock wlsunset brightnessctl playerctl xwayland-satellite imv chafa qalculate-qt file-roller dconf-editor evince git gh direnv ripgrep fd bat jq gdu unzip file wget psmisc gcc ffmpeg texlab qt5ct qt6ct nwg-look pipewire pipewire-pulseaudio wireplumber rtkit bluez power-profiles-daemon vulkan-tools greetd
```

`nodejs24` → `/usr/bin/node`. `neovim` → `nvim`. AMD-Vulkan via `libvulkan_radeon` + `vulkan-tools`.
`opentabletdriver` separat (RPM `--nodeps`, siehe Abschnitt 3).

## 2. Alle Zypper-Apps mit Version (66, alle verifiziert)

| Paket | Version | Wozu |
|---|---|---|
| foot | 1.28.0 | Standard-Terminal |
| kitty | 0.48.2 | Terminal extra |
| alacritty | 0.17.0 | Terminal extra |
| fish | 4.8.1 | Standard-Shell |
| starship | 1.26.0 | Prompt |
| tmux | 3.7b | Multiplexer |
| yazi | 26.8.15 | TUI-Files |
| lazygit | 0.65.1 | TUI-Git |
| btop | 1.4.7 | Monitor |
| fastfetch | 2.69.0 | Fetch |
| fzf | 0.74.4 | Fuzzy |
| eza | 0.23.5 | ls |
| zoxide | 0.10.0 | cd |
| neovim | 0.12.5 | Editor CLI (LazyVim) |
| mpv | 0.41.0 | Video |
| zathura | 2026.10.4 | PDF (Standard) |
| nautilus | 50.4 | Files (Standard) |
| mpd | 0.24.15 | Musik-Daemon |
| rmpc | 0.11.0 | MPD-TUI |
| kew | 4.3.8 | Musik-TUI |
| wiremix | 0.11.0 | Audio-TUI |
| cava | 1.0.0 | Visualizer |
| steam | 1.0.0.87 | Gaming |
| gamemode | 1.8.2 | Gaming-Boost |
| mangohud | 0.8.4 | Gaming-Overlay |
| docker | 29.7.2 | Container |
| tailscale | 1.104.1 | VPN (`tailscale up` manuell) |
| nodejs24 | 24.18.1 | Node (`/usr/bin/node`) |
| blender | 5.2 | 3D |
| inkscape | 1.4.4 | Vektor |
| krita | 5.3.4.1 | Paint |
| godot | 4.7.2 | Engine |
| grim / slurp | 1.5.0 / 1.6.0 | Screenshots |
| swaylock | 1.8.6 | Lock |
| wlsunset | 0.4.0 | Nachtmodus |
| brightnessctl | 0.5.1 | Helligkeit |
| playerctl | 2.4.1 | Medienkeys |
| xwayland-satellite | 0.8.3 | XWayland |
| imv | 5.0.1 | Bilder |
| chafa | 1.18.3 | Terminal-Bilder |
| qalculate-qt | 5.12.0 | Rechner |
| file-roller | 44.7 | Archive |
| dconf-editor | 49.0 | dconf |
| evince | 48.4 | Doku-Viewer |
| git / gh / direnv | 2.56.0 / 2.100.0 / 2.37.1 | Dev |
| ripgrep / fd / bat | 15.2.0 / 10.4.2 / 0.26.1 | Suche/Anzeige |
| jq / gdu | 1.8.2 / 5.36.1 | JSON/Disk |
| unzip / file / wget / psmisc | div. | Basis |
| gcc / ffmpeg / texlab | 16 / 9.0.2 / 5.24.0 | Build/Medien/LaTeX |
| qt5ct / qt6ct / nwg-look | div. | Qt/GTK-Theming |
| pipewire / wireplumber | 1.6.9 / 0.5.18 | Audio |
| vulkan-tools / greetd | 1.4.363 / 0.10.3 | Vulkan-Test / Login-Manager |

## 3. Upstream + Flatpak (10 + 2, nie Distro-Paket)

| App | Version | Weg | Ziel |
|---|---|---|---|
| Umbriel | 0.1.0 | source `github.com/noctalia-dev/umbriel` | `~/.local/bin/umbriel` |
| Noctalia | v5.2.1 | source `github.com/noctalia-dev/noctalia` | `~/.local/bin/noctalia` |
| Greeter | — | source `github.com/noctalia-dev/noctalia-greeter` | `/usr/local/bin/noctalia-greeter-*` |
| Walker | 2.17.2 | binary `github.com/abenz1267/walker` | `~/.local/bin/walker` |
| Zen | 1.23.2b | tarball `docs.zen-browser.app/guides/install-linux` | `~/.local/bin/zen` |
| Zed | — | `curl -f https://zed.dev/install.sh \| sh` | `~/.local/zed.app`, `~/.local/bin/zed+zeditor` |
| pi | 0.73.1 | `npm i -g @mariozechner/pi-coding-agent` | `~/.local/bin/pi` |
| OMP | 0.2.0 | `pi install npm:oh-my-pi` (NICHT npm-global) | Pi-Extension |
| opencode | v2.0.26 | `curl -fsSL https://opencode.ai/install \| bash` | `/usr/bin/opencode` |
| OpenTabletDriver | 0.6.7 | RPM `sudo rpm -i --nodeps` + user-dotnet 8.0.32 | `/usr/bin/otd*` |
| Obsidian | 1.14.4 | `flatpak install --user flathub md.obsidian.Obsidian` | flatpak-user |
| Prism Launcher | 11.1.1 | `flatpak install --user flathub org.prismlauncher.PrismLauncher` | flatpak-user |

Build-Befehle: `AGENTS.md`.

## 4. Launcher-Einträge (effektiv 30, nach Overrides)

`apps/snapshot/desktop-entries-effective.txt`. Versteckt per
`configs/desktop/launcher-overrides/` + `update-desktop-database`: Foot-Client/Server,
Noctalia-Daemon, YaST-Software/1-Click, Konsole, Parental-Controls, Tweaks/Extensions,
ColorProfileViewer, Evince (→ Zathura-Standard), KDE-CrashHandler, Super-User-Terminal.

## 5. Nicht installieren

Aus Repo gelöscht: ghostty, cliamp, sonora, toofan, slipper, rofi, osu-ini,
headset-Regel, zsh-Backup, Nix-Referenzskripte, alte Duplikate.
Nie installiert gewesen: bw, lms, headsetcontrol, lazydocker, osu, LMStudio,
Flare, Concord, Readest, Serein.
