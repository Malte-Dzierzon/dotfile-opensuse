# Limine auf Tumbleweed (statt YaST-Bootloader-Auswahl)

YaST kennt kein Limine (`bootloader_factory.rb`: nur grub2/systemd-boot/none).
Daher: YaST-Bootloader-Einstellung auf **systemd-boot lassen** — dessen
BLS-Einträge füttern den Generator. Limine wird von Hand eingerichtet.

## Stand
- Paket `limine` aus OSS (in `apps/app-inventory.md` Zypper-Block aufnehmen).
- Binary: `/boot/efi/EFI/limine/BOOTX64.EFI` (Kopie aus `/usr/share/limine/`).
- Config: `/boot/efi/limine.conf`, generiert von `system/scripts/update-limine`.
- NVRAM: Eintrag `Limine` → `\EFI\limine\BOOTX64.EFI` (BootOrder-erste, Firmware
  hat ihn beim Anlegen automatisch priorisiert). systemd-boot-Eintrag als
  Fallback **nicht löschen**.
- Menü: `//openSUSE Tumbleweed`, `//Snapshots/<titel>` (neueste 10),
  `//Windows` (per `efi_boot_entry`, ohne Platten-Raten),
  `//Fallback/systemd-boot` (Chainload). Theme Noctalia-Grau aus der
  Noctalia-Palette (`backdrop 20262C`, Schrift `E9EFEB`, Akzent `BBCCE7`).
- Secure Boot ist aus — gut, Limine-Binary ist nicht MS-signiert.

## Neuinstallation (Reihenfolge)
```sh
su -c 'zypper install limine'
su -c 'mkdir -p /boot/efi/EFI/limine && cp /usr/share/limine/BOOTX64.EFI /boot/efi/EFI/limine/BOOTX64.EFI && /home/$USER/.local/bin/update-limine && efibootmgr --create --disk /dev/sda --part 1 --label Limine --loader "\\EFI\\limine\\BOOTX64.EFI"'
```
(`--disk/--part` ans ESP anpassen; hier `/dev/sda1`, PARTUUID `44e8e6ef-…`.)

## Nach jedem Kernel-Update
```sh
su -c '/home/$USER/.local/bin/update-limine'
```
Sonst fehlen neue Kernel im Menü. Optional: per `systemd.path` auf
`/boot/efi/opensuse-tumbleweed/` automatisieren (Service enablen = bewusst
entscheiden, bisher manuell).

## Root-Qt dunkel (YaST)
`system/root-qt5ct/qt5ct.conf` + Farbschema
`configs/desktop/qt/qt5ct/colors/noctalia.conf` nach `/root/.config/qt5ct/`:
```sh
su -c 'mkdir -p /root/.config/qt5ct/colors && cp configs/desktop/qt/qt5ct/colors/noctalia.conf /root/.config/qt5ct/colors/ && cp system/root-qt5ct/qt5ct.conf /root/.config/qt5ct/qt5ct.conf'
```
