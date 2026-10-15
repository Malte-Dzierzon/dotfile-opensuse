# dconf — GNOME-Einstellungen als Textdump

`user-db.dump` = `dconf dump /` vom Live-System (Nautilus-Prefs, Terminal-/
Interface-Farben u.a.). Kein Secret enthalten (Online-Accounts/Keys liegen in
libsecret, WLAN-PSKs in root-lesbaren NM-Profilen — beides nicht im Dump).

## Sichern / Wiederherstellen
```sh
dconf dump / > configs/desktop/dconf/user-db.dump
dconf load / < configs/desktop/dconf/user-db.dump
```
Kein blinder Load auf fremder Hardware: erst diffen, dann gezielt laden.
Browser-Profile (`~/.config/zen`, 100+ MB), mpv (leer) und Secrets
(`~/.config/gh`, `goa-1.0`, Evolution) werden bewusst NICHT versioniert.
