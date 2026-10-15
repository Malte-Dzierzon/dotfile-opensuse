# App-Inventory — openSUSE Tumbleweed Snapshot 2026-10-15

Verifiziert auf live-System `xealom@linux` (2918 rpm, 2 flatpak-user).
Nur was hier unter **installiert** steht, auf neuer SSD installieren.
**Nicht installiert** = Config ggf. im Repo, aber Binary fehlt — nicht mitinstallieren.

## Zypper nativ (ein Block)

```bash
sudo zypper install -y foot kitty alacritty fish starship tmux yazi lazygit btop fastfetch fzf eza zoxide neovim mpv zathura nautilus mpd rmpc kew wiremix cava steam gamemode mangohud docker tailscale nodejs24 blender inkscape krita godot grim slurp swaylock wlsunset brightnessctl playerctl xwayland-satellite imv chafa qalculate-qt file-roller dconf-editor evince git gh direnv ripgrep fd bat jq gdu unzip file wget psmisc gcc ffmpeg texlab qt5ct qt6ct nwg-look pipewire pipewire-pulseaudio wireplumber rtkit bluez power-profiles-daemon vulkan-tools greetd
```

Hinweise: `nodejs24` liefert `/usr/bin/node`. `neovim`-Paket liefert `nvim`.
Vulkan/AMD kommt via vorinstalliertem `libvulkan_radeon` + `vulkan-tools` — kein Treiber-Setup nötig.
`opentabletdriver` separat (siehe unten), NICHT in obigem Block.

## Flatpak --user (nur diese zwei)

```bash
flatpak install --user -y flathub md.obsidian.Obsidian org.prismlauncher.PrismLauncher
```
Installiert: Obsidian 1.14.4, Prism Launcher 11.1.1.

## Upstream (nie Distro-Paket)

| App | Version | Weg | Ziel |
|---|---|---|---|
| Umbriel | 0.1.0 | source `github.com/noctalia-dev/umbriel` | `~/.local/bin/umbriel` |
| Noctalia | v5.2.1 | source `github.com/noctalia-dev/noctalia` | `~/.local/bin/noctalia` |
| Greeter | — | source `github.com/noctalia-dev/noctalia-greeter` | `/usr/local/bin/noctalia-greeter-*` |
| Walker | 2.17.2 | upstream binary `github.com/abenz1267/walker` | `~/.local/bin/walker` |
| Zen | 1.23.2b | tarball-script `docs.zen-browser.app/guides/install-linux` | `~/.local/bin/zen` |
| Zed | — | `curl -f https://zed.dev/install.sh \| sh` | `~/.local/zed.app`, `~/.local/bin/zed`, `zeditor` |
| pi | 0.73.1 | `npm i -g @mariozechner/pi-coding-agent` (scoped, kein unscoped `pi-coding-agent`) | `~/.local/bin/pi` |
| OMP | 0.2.0 | `pi install npm:oh-my-pi` (Pi-Paketmanager, NICHT `npm -g`) | Pi-Extension |
| opencode | v2.0.26 | `curl -fsSL https://opencode.ai/install \| bash` | `/usr/bin/opencode` |
| OpenTabletDriver | 0.6.7 | `opentabletdriver-0.6.7-1.x86_64.rpm` via `sudo rpm -i --nodeps`, plus user-dotnet 8.0.32 (`DOTNET_ROOT=~/.dotnet` via systemd-override) | `/usr/bin/otd*` |

Build-Rezepte für Umbriel/Noctalia/Greeter stehen in `AGENTS.md` (exakte Befehle, keine Websuche nötig).

## Nicht installiert (nicht mitnehmen)

ghostty (bewusst entfernt), cliamp/sonora/toofan/slipper (nur Config-Reste, kein Binary),
rofi (durch Walker ersetzt), bw/lms/headsetcontrol/lazydocker/osu/LMStudio/Flare/Concord/Readest/Serein
(nur alter NixOS-Katalog, auf diesem System nie installiert). Configs bleiben ggf. im Repo als
Referenz, werden aber beim Neuaufbau NICHT installiert.
