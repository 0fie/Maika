<h1 align="center">
  <img src="https://raw.githubusercontent.com/0fie/trash/main/my-nixos-setup.png"  />
  <br>
  My ultra-simple NixOS setup.
</h1>

<p align="center">
  This is the NixOS config that powers my laptop. It might not look like much, but I swear it gets the job done. 🙂<br/>
</p>

## Features

-  🪟 Compositor/WM >> [Hyprland](https://hyprland.org) (without Xwayland, I don't run X apps, yuck.)
-  Terminal >> [Kitty](https://sw.kovidgoyal.net/kitty/) (bloated, I'm only there for the image protocol, its awesome)
-  Code Editor >> [Helix](https://helix-editor.com) (the greatest code editor since Neovim)
-  🔒️ Screenlock >> [Hyprlock](https://github.com/hyprwm/hyprlock) (This software is a work of art)
-  💤 Idle management daemon >> [Hyprlock](https://github.com/hyprwm/hypridle) (Another work of art from @vaxerski)
-  🎨 Theme >> [Catppuccin](https://github.com/catppuccin/catppuccin) (the mocha variant, system-wide from CLI to GUI)
-  🖼️  Image viewer >> [Loupe](https://apps.gnome.org/Loupe/) (GPU-accelarated, elegant UI)
-  🌐 Web browser >> Firefox
-  💼 Office suite >> LibreOffice
-  🎧️ Media player >> VLC

## Philosophy and design principles

Simplicity... as a simple person with simple requirements, I sought to craft a NixOS config to daily drive on my old Dell laptop.
Here is a quick explanation of the folder structure. This "project" is a [flake](https://zero-to-nix.com/concepts/flakes) as you 
might have noticed. The home directory contains my [home-manager](https://github.com/nix-community/home-manager) configuration for apps
like Firefox, Spotify etc. The system directory holds system-level configs, like the hostname, etc. You can also configure the
Nix package manager from there. And that's just about it. Simple, right?


## How to Install?

#### Edit the 2 options.nix files
You can not install this NixOS config directly on your machine. Well... you can, but you gotta jump through some hoops first.
1. Assumming you've already cloned this repo and CD'd into it, edit the [home/options.nix](home/options.nix) file. You probably want to
change the git username & email as well as the dotfiles dir. If you're using Helix as your editor:

```bash
hx home/options.nix
```

2. Now you need to the edit [system/options.nix](system/options.nix) file. Edit it as you see fit. You probably want to change
the hostname, timezone and locale.

```bash
hx system/options.nix
```

#### Generate the suitable hardware configuration for your rig
- The hardware configuration is located in [system/hardware-configuration.nix](system/hardware-configuration.nix). You're probably
not using the exact same 11yr old Dell laptop as I am, so let's generate the appropriate hardware config for your computer. Run the
following command:

```bash
nixos-generate-config --show-hardware-config > system/hardware-configuration.nix
```

#### Configure boot settings
This is the slightly complicated part. By default, my config is meant for ancient systems that use GRUB and legacy boot; BIOS, not UEFI.
So unless your machine has BIOS or was made sometime before the year 2010, you use UEFI. You probably know what I'm trying (and failing)
to explain so here is the way forward.
If you're on UEFI, you need the boot config:

```bash
echo '{ config, ... }:' > system/sys.nix 
echo '' >> system/sys.nix 
echo '{' >> system/sys.nix
echo '  # Bootloader' >> system/sys.nix
echo '  boot.loader.systemd-boot.enable = true;' >> system/sys.nix   
echo '  boot.loader.efi.canTouchEfiVariables = true;' >> system/sys.nix   
echo '  boot.kernel.sysctl = { "vm.max_map_count" = 2147483642; };' >> system/sys.nix  
echo '  boot.tmp.useTmpfs = true;' >> system/sys.nix   
echo '  boot.tmp.tmpfsSize = "25%";' >> system/sys.nix   
echo '}' >> system/sys.nix 
```
