<h1 align="center">
   <img src="https://github.com/0fie/Dotfiles/assets/151028199/6da7fe65-6661-4bb6-b5bc-b72aa6d79a7a" width="100px" /> 
   <br>
      0fie's ultra-simple NixOS Config 
   <br>
      <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br>
   <div align="center">

   <div align="center">
      <p></p>
      <div align="center">
         <a href="https://github.com/0fie/Dotfiles/stargazers">
            <img src="https://img.shields.io/github/stars/0fie/Dotfiles?color=F5BDE6&labelColor=303446&style=for-the-badge&logo=starship&logoColor=F5BDE6">
         </a>
         <a href="https://github.com/0fie/Dotfiles/">
            <img src="https://img.shields.io/github/repo-size/0fie/Dotfiles?color=C6A0F6&labelColor=303446&style=for-the-badge&logo=github&logoColor=C6A0F6">
         </a>
         <a = href="https://nixos.org">
            <img src="https://img.shields.io/badge/NixOS-unstable-pink.svg?style=for-the-badge&labelColor=303446&logo=NixOS&logoColor=white&color=91D7E3">
         </a>
         <a href="https://github.com/0fie/Dotfiles/blob/main/LICENSE">
            <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=313244&colorB=F5A97F&logo=unlicense&logoColor=F5A97F&"/>
         </a>
      </div>
      <br>
   </div>
</h1>

<br>
</div>

<p align="center">
   <img src="https://github.com/0fie/trash/blob/34df9541c906fd31d69e890bc73855312b168d6d/RICE-2024-03-15-At-04h23m22s.png" width="800px" /> <br>
</p>
<p align="center">
   Screeenshot last updated on <b>2024-03-15</b>
</p>

### 📓 Components
| Type                        | Program                                                                                       |
| --------------------------- | :---------------------------------------------------------------------------------------------:
| **Compositor**              | [Hyprland][Hyprland] |
| **Lockscreen**              | [Hyprlock][Hyprlock] |
| **Idle Mgmt. Daemon**       | [Hypridle][Hypridle] |
| **Wallpaper Setter**        | [Hyprpaper][Hyprpaper] |
| **Text Editor**             | [Helix][Helix] |
| **Shell**                   | [Nushell][Nushell] + [Starship][Starship] |
| **Terminal Emulator**       | [Kitty][Kitty] |
| **Notification Daemon**     | [Mako][Mako] |
| **Color Scheme**            | [Catppuccin][Catppuccin] |
| **Screenshot Software**     | [Grimblast][Grimblast] |
| **Application Launcher**    | [rofi-wayland][rofi-wayland] |
| **Music Player**            | [Spotify][Spotify] |
| **Bar**                     | [Waybar][Waybar] |
| **Network Mgmt. Tool**      | [NetworkManager][NetworkManager] + [network-manager-applet][network-manager-applet] |
| **System resource monitor** | [Btop][Btop] |
| **File Manager**            | [Nautilus][Nautilus] + [lf][lf] |
| **Fonts**                   | [Nerd fonts][Nerd fonts] |
| **Cursor**                  | [Bibata-Modern-Ice][Bibata-Modern-Ice] |
| **Icons**                   | [catppuccin-papirus-folders][catppuccin-papirus-folders] |
| **Image Viewer**            | [Loupe][Loupe] |
| **Media Player**            | [VLC][VLC] |
| **Screen Recording**        | [VLC 👈️][VLC] |
| **Clipboard**               | [wl-clipboard][wl-clipboard] |
| **Office Suite**            | [LibreOffice][LibreOffice] |

## Philosophy and design principles

Simplicity... as a simple person with simple requirements, I sought to craft a NixOS config to daily drive on my old Dell laptop.
Here is a quick explanation of the folder structure. This "project" is a [flake](https://zero-to-nix.com/concepts/flakes) as you 
might have noticed. The home directory contains my [home-manager](https://github.com/nix-community/home-manager) configuration for apps
like Firefox, Spotify etc. The system directory holds system-level configs, like the hostname, etc. You can also configure the
Nix package manager from there. And that's just about it. Simple, right?


## How to Install?
> [!TIP]
> You can't, lol

First of all, you're not supposed to install my NixOS config on your computer. I didn't have that kind of sharing in mind when I wrote
these configs. You should cherry-pick the `.nix` files that you're interested in. Let's say you admire my Cava setup and you'd
like to have it as part of your system... you'd simply copy my [home/cava.nix](home/cava.nix) file into **your** config directory, and then import it.
However, if you're still adamant about installing my configs on your machine, or would like to fork my flake, follow the cursed steps below.

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
If you're on UEFI, you need to add the boot config by **running** the following command.:

```bash
echo '
{ pkgs, ... }:

{
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "ntfs" ];
    loader = {
      timeout = 10;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      themePackages = with pkgs; [(
        adi1090x-plymouth-themes.override {
          selected_themes = [ "connect" ];
        }
      )];
    };
  };
}
' > system/boot.nix
```

If you've made it this far, run

```bash
sudo nixos-rebuild boot --flake .# && reboot
```

> [!WARNING]
> The instructions above were never tested, lol 😅


<hr>


### I got a lot of inspiration as well as actual code from the following sources:

- [Aylur/dotfiles](https://github.com/Aylur/dotfiles) - Nushell, Helix config, UEFI boot stuff for the instructions above
- [NotAShelf/Nyx](https://github.com/NotAShelf/Nyx) - Helix config, plus dozens of other snippets from their ultra-complex setup
- [Misterio77/nix-config](https://github.com/Misterio77/nix-config) - Firefox declaration with addons, Helix config
- [rubyowo/dotfiles](https://github.com/rubyowo/dotfiles) - Catppuccin themes for CLI tools like bat, cava etc. Thank you!
- [My Linux For Work Dotfiles 2.7 - 2.8](https://gitlab.com/stephan-raabe/dotfiles) - Inspiration for hyprlock and hypridle
- [isabelroses/dotfiles](https://github.com/isabelroses/dotfiles/) - Catppuccin for SDDM and Plymouth, thank you!
- [prasanthrangan/hyprdots](https://github.com/prasanthrangan/hyprdots) - Hyprland animations
- [Frost-Phoenix/nixos-config](Frost-Phoenix/nixos-config) - Maxfetch, Starship, Kitty, Discord, Hyprland window rules, Waybar


### Other learning resources that have also been helpful
- [NixOS and Flakes Book](https://nixos-and-flakes.thiscute.world)
- [Vimjoyer's Nix playlist](https://www.youtube.com/playlist?list=PLko9chwSoP-15ZtZxu64k_CuTzXrFpxPE)
- [NixOS Discord](https://discord.com/invite/2HeKRM3)
- [Zaney's Blog](https://zaney.org/)

###### Special thanks to [NobbZ](https://github.com/NobbZ) for answering all my questions on Discord.

<!-- links -->
[Hyprland]: https://github.com/hyprwm/Hyprland
[Kitty]: https://github.com/kovidgoyal/kitty
[Starship]: https://github.com/starship/starship
[Waybar]: https://github.com/Alexays/Waybar
[Btop]: https://github.com/aristocratos/btop
[grimblast]: https://github.com/hyprwm/contrib
[Mako]: https://github.com/emersion/mako
[Nerd fonts]: https://github.com/ryanoasis/nerd-fonts
[NetworkManager]: https://wiki.gnome.org/Projects/NetworkManager
[network-manager-applet]: https://gitlab.gnome.org/GNOME/network-manager-applet/
[wl-clipboard]: https://github.com/bugaevc/wl-clipboard
[Catppuccin]: https://github.com/catppuccin/catppuccin
[catppuccin-papirus-folders]: https://github.com/catppuccin/papirus-folders
[Nushell]: https://www.nushell.sh
[rofi-wayland]: https://github.com/lbonn/rofi
[Helix]: https://helix-editor.com/
[Nautilus]: https://wiki.gnome.org/Apps/Files
[lf]: https://godoc.org/github.com/gokcehan/lf
[Hypridle]: https://github.com/hyprwm/hypridle
[Hyprlock]: https://github.com/hyprwm/hyprlock
[Hyprpaper]: https://github.com/hyprwm/hyprpaper
[Bibata-Modern-Ice]: https://github.com/ful1e5/Bibata_Cursor
[Loupe]: https://apps.gnome.org/Loupe/
[VLC]: https://www.videolan.org/vlc/
[Spotify]: https://spotify.com
[LibreOffice]: https://www.libreoffice.org/
