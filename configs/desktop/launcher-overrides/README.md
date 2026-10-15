# launcher-overrides — `~/.local/share/applications/` (+ Unterordner 1:1 spiegeln)

## YaST-Satz (passwortfrei, Wayland-fähig, dunkel)
13× `YaST2/*.desktop` + `org.opensuse.YaST.desktop` + `org.opensuse.yast.Packager.desktop`:
`Exec=` ruft `~/.local/bin/yast-root` auf (braucht `system/scripts/yast-root`
und `system/sudoers.d/10-yast-nopasswd`). Enthaltene Module: Software
(`sw_single`, auch `Packager` für RPM-Dateien), Repos, Partitionierer,
Bootloader, Netzwerk, Firewall, Host, Proxy, Remote, Snapshots, Alternativen,
Virtualisierung, Relocation, YaST-Kontrollzentrum.
Achtung: `org.opensuse.yast.Packager.desktop` war früher `NoDisplay=true`
(Eintrag versteckt) — jetzt sichtbarer passwortfreier Starter.

## Installieren
```sh
cp configs/desktop/launcher-overrides/*.desktop ~/.local/share/applications/
mkdir -p ~/.local/share/applications/YaST2
cp configs/desktop/launcher-overrides/YaST2/*.desktop ~/.local/share/applications/YaST2/
update-desktop-database ~/.local/share/applications/
```
