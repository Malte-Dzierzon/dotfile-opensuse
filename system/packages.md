# Packages — openSUSE Tumbleweed Snapshot 2026-10-15

User-Bundle: siehe `apps/app-inventory.md` (ein zypper-Block + 2 Flatpaks + 10 Upstream).
Hier nur System-/Namen-Notizen, keine Doppelpflege.

- `nodejs24` (nicht `nodejs`) liefert `/usr/bin/node`. `neovim` liefert `nvim`.
- Vulkan AMD: `libvulkan_radeon` vorinstalliert, dazu `vulkan-tools`. Kein `Mesa-vulkan-drivers`
  (heißt hier `Mesa-vulkan-*`), keine Treiberarbeit nötig.
- Audio: `pipewire pipewire-pulseaudio wireplumber rtkit bluez`. Bluetooth drin.
- Login: `greetd` 0.10.3 + noctalia-greeter nach `/usr/local`. GDM nur bis Greeter verifiziert bleibt.
- Tablet: `opentabletdriver-0.6.7-1.x86_64.rpm` mit `sudo rpm -i --nodeps`,
  dazu user-dotnet 8.0.32 (`DOTNET_ROOT=~/.dotnet`, Override in `~/.config/systemd/user/`).
- Build-Tools für Umbriel/Noctalia/Greeter: `meson ninja gcc pkgconf just` + Wayland/wlroots-Devels
  (Tumbleweed liefert wlroots 0.20.x, von Umbriel benötigt). Exakte Build-Befehle in `AGENTS.md`.
- Reste vom De-Bloat beachten: `blender-5.1-demo` kann noch vorhanden sein, `ghostty` ist weg,
  `office`-Pattern ist entfernt. Frischinstallation: minimal + Wayland-Base wählen, dann fällt
  De-Bloat weitgehend weg.
