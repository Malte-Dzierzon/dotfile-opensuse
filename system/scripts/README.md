# system/scripts — Starter-Scripts für `~/.local/bin/`

## Dateien
- `xdg-su` — Shim vor `/usr/bin/xdg-su` (PATH: `~/.local/bin` steht zuerst).
  Bettet Wayland-Env (`WAYLAND_DISPLAY`, `XDG_RUNTIME_DIR`, `DISPLAY`,
  `QT_QPA_PLATFORM=wayland`, `DBUS_SESSION_BUS_ADDRESS`) als Literale in den
  `-c`-Befehl ein, weil `gnomesu` (X11-only) es sonst schluckt und YaST als
  Root ohne Display still stirbt. Nur für Root-Ziele (default); `--help` etc.
  laufen durch. Debug ohne Passwort-Prompt: `XDG_SU_SHIM_DEBUG=1 xdg-su …`.
  Grund: `XDG_CURRENT_DESKTOP=umbriel` kennt `xdg-su` nicht; erzwungen per
  `XDG_UTILS_SU_OVERRIDE_DE=gnome` (siehe `configs/desktop/umbriel/env.toml`).
- `yast-root` — Passwortfreier YaST-Starter: `sudo -n` (braucht
  `system/sudoers.d/10-yast-nopasswd`) + Wayland-Env + `QT_QPA_PLATFORMTHEME=qt5ct`
  (dunkel, siehe `system/root-qt5ct/`). Fehler landen in `/tmp/yast-root.err`,
  mit Zenity-Dialog wenn verfügbar. Alle YaST-`.desktop`-Overrides rufen das auf.
- `update-limine` — Generiert `/boot/efi/limine.conf` aus sdbootutil-BLS
  (`/boot/efi/loader/entries/*.conf`). Details siehe `system/boot/limine/README.md`.

## Installieren
```sh
cp system/scripts/{xdg-su,yast-root,update-limine} ~/.local/bin/
chmod +x ~/.local/bin/{xdg-su,yast-root,update-limine}
command -v xdg-su   # muss ~/.local/bin/xdg-su zeigen
```

## Prüfen
```sh
sh -n ~/.local/bin/{xdg-su,yast-root,update-limine}
XDG_SU_SHIM_DEBUG=1 xdg-su -c "/sbin/yast2 sw_single"
~/.local/bin/yast-root --list
```
