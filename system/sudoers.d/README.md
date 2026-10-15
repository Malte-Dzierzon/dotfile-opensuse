# sudoers.d — passwortfreies YaST

## Was
`10-yast-nopasswd` erlaubt `xealom`, `/sbin/yast2` (== `/usr/sbin/yast2`,
`/sbin` ist ein Symlink) per `sudo -n` **ohne Passwort** als Root zu starten.
`SETENV:` ist Pflicht, weil openSUSE-sudo `VAR=Wert`-Übergaben auf der
Kommandozeile sonst verweigert (`sorry, you are not allowed to set the
following environment variables`) — und genau so reicht `yast-root` das
Wayland-Env durch.

Sicherheitswert: Wer an der entsperrten Sitzung sitzt, hat über YaST faktisch
Root (Software, Partitionierer, Bootloader). Bewusst so entschieden.

## Installieren (einmalig, Root-Passwort nötig)
```sh
su -c 'cp system/sudoers.d/10-yast-nopasswd /etc/sudoers.d/10-yast-nopasswd && chmod 0440 /etc/sudoers.d/10-yast-nopasswd && visudo -c'
```
`visudo -c` muss `parsed OK` melden. Hinweis: `visudo -c` warnt ggf. über
`/usr/etc/sudoers: bad permissions` — bekanntes Systemproblem, nicht von
dieser Datei verursacht.

## Prüfen
```sh
sudo -n /sbin/yast2 --list   # Modulliste ohne Prompt
~/.local/bin/yast-root --list
```
