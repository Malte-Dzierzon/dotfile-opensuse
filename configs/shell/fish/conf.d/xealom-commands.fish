# xealom-commands — Wartungs-Shortcuts, 2026-10-15
# Einmalige Setup-Installs sind hier NICHT drin (bereits erledigt).
# sudo-Passwort wird jeweils im Terminal abgefragt.

function sys-update --description 'zypper dup + Flatpak-User-Update'
    sudo zypper dup --no-allow-vendor-change -y
    and flatpak update --user -y
end

function sys-pkgs-big --description 'Top 40 Pakete nach Groesse'
    rpm -qa --queryformat '%{SIZE} %{NAME}\n' | sort -rn | head -n 40
end

function sys-pkgs-list --description 'Alle RPMs + Flatpaks + Patterns'
    rpm -qa | sort | less
    flatpak list --user --app
    flatpak list --system --app
    zypper patterns --installed-only | grep -E '^i'
end

function agents-update --description 'pi-Extensions + npm-globals + Flatpak-User aktualisieren'
    pi update
    npm update -g
    flatpak update --user -y
end

function fix-nautilus --description 'Nautilus nach De-Bloat neu installieren'
    sudo zypper install -y nautilus
end

function debloat-evo --description 'Evolution entfernen (Deps-Liste pruefen!)'
    echo 'ACHTUNG: Falls gnome-shell/gdm/mutter/nautilus dabei steht -> mit c abbrechen!'
    sudo zypper remove evolution evolution-data-server evolution-ews
end

function debloat-extra --description 'Doppel-Blender, ungenutzte Firmware, Emoji-Dict, Office-Pattern weg'
    sudo zypper remove -y blender-5.1 blender-5.1-lang kernel-firmware-qcom kernel-firmware-mellanox kernel-firmware-nvidia kernel-firmware-prestera ibus-dict-emoji
    sudo zypper remove -t pattern -y office
end

function greeter-on --description 'Noctalia-Greeter aktivieren (NUR per TTY! danach rebooten)'
    echo 'Nur aus TTY (Strg+Alt+F3) ausfuehren, NICHT aus der grafischen Session!'
    printf '[terminal]\nvt = 1\n\n[default_session]\ncommand = "/usr/local/bin/noctalia-greeter-session -- --session Umbriel"\nuser = "greeter"\n' | sudo tee /etc/greetd/config.toml > /dev/null
    sudo systemctl disable gdm
    sudo systemctl enable greetd
    echo 'Fertig. Jetzt: sudo reboot'
end

function rebuild-umbriel --description 'Umbriel aus Source neu bauen + installieren'
    cd ~/src/umbriel
    and git pull --ff-only
    and meson setup build --buildtype=release --prefix=$HOME/.local -Dtests=disabled --reconfigure
    and meson compile -C build
    and meson install -C build
end

function rebuild-noctalia --description 'Noctalia neu bauen + nach ~/.local installieren'
    cd ~/src/noctalia
    and git pull --ff-only
    and just configure release "$HOME/.local"
    and just build release
    and just install release
end

function rebuild-greeter --description 'Noctalia-Greeter neu bauen (Install danach per sudo im TTY)'
    cd ~/src/noctalia-greeter
    and git pull --ff-only
    and meson setup build-release --buildtype=release --reconfigure
    and meson compile -C build-release
    and echo 'Danach im TTY: sudo meson install -C build-release && sudo ./scripts/setup_greeter_system.sh'
end
