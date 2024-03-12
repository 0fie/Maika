<h2 align="center">:snowflake: 0fie's Ultra-Simple NixOS Config :snowflake:</h2>

<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="400" />
</p>

<p align="center">
	<a href="https://github.com/0fie/Dotfiles/stargazers">
		<img alt="Stargazers" src="https://img.shields.io/github/stars/0fie/Dotfiles?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"></a>
    <a href="https://nixos.org/">
        <img src="https://img.shields.io/badge/NixOS-unstable-informational.svg?style=for-the-badge&logo=nixos&color=F2CDCD&logoColor=D9E0EE&labelColor=302D41"></a>
    <a href="https://github.com/ryan4yin/nixos-and-flakes-book">
        <img src="https://img.shields.io/static/v1?label=Nix Flakes&message=learning&style=for-the-badge&logo=nixos&color=DDB6F2&logoColor=D9E0EE&labelColor=302D41"></a>
  </a>
</p>

## Notable Features?
|----------------------------|-----------------------------------------------------------------------------------------------
|  🪟 Compositor/WM          | [Hyprland](https://hyprland.org) (without Xwayland, I don't run X apps, yuck.)
|    Terminal >>            | [Kitty](https://sw.kovidgoyal.net/kitty/) (bloated, I'm only there for the image protocol, its awesome)
|    Code Editor >>         | [Helix](https://helix-editor.com) (the greatest code editor since Neovim)
|  🔒️ Screenlock >>          | [Hyprlock](https://github.com/hyprwm/hyprlock) (This software is a work of art)
|  💤 Idle management daemon | [Hypridle](https://github.com/hyprwm/hypridle) (Another work of art from [@vaxerski](https://github.com/vaxerski))
|  🎨 Theme >>               | [Catppuccin](https://github.com/catppuccin/catppuccin) (the mocha variant, system-wide from CLI to GUI)
|  🖼️  Image viewer           | [Loupe](https://apps.gnome.org/Loupe/) (GPU-accelarated, elegant UI)
|  🚀 App Launcher           | [rofi-wayland]()
|  🔔 Notification Daemon    | [Mako]()
|  📂 File Managers          | [Natilus]() + [LF]()
|  🎥 Screenshots >>         | [Grim]() + [Slurp]()
|  🐚 Shell & Prompt         | [ZSH]() + [Starship]()
|  🌐 Web browser            | Firefox
|  💼 Office suite           | LibreOffice
|  🎧️ Media player           | VLC



|                             | NixOS(Wayland)                                                                                                    | NixOS(Xorg)                                                                                                       |
| --------------------------- | :---------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------- |
| **Window Manager**          | [Hyprland][Hyprland]                                                                                              | [i3][i3]                                                                                                          |
| **Terminal Emulator**       | [Zellij][Zellij] + [Kitty][Kitty]                                                                                 | [Zellij][Zellij] + [Kitty][Kitty]                                                                                 |
| **Bar**                     | [Waybar][Waybar]                                                                                                  | [polybar][polybar]                                                                                                |
| **Application Launcher**    | [anyrun][anyrun]                                                                                                  | [rofi][rofi]                                                                                                      |
| **Notification Daemon**     | [Mako][Mako]                                                                                                      | [Dunst][Dunst]                                                                                                    |
| **Display Manager**         | [GDM][GDM]                                                                                                        | [GDM][GDM]                                                                                                        |
| **Color Scheme**            | [Catppuccin][Catppuccin]                                                                                          | [Catppuccin][Catppuccin]                                                                                          |
| **network management tool** | [NetworkManager][NetworkManager]                                                                                  | [NetworkManager][NetworkManager]                                                                                  |
| **Input method framework**  | [Fcitx5][Fcitx5]                                                                                                  | [Fcitx5][Fcitx5]                                                                                                  |
| **System resource monitor** | [Btop][Btop]                                                                                                      | [Btop][Btop]                                                                                                      |
| **File Manager**            | [Yazi][Yazi] + [thunar][thunar]                                                                                   | [Yazi][Yazi] + [thunar][thunar]                                                                                   |
| **Shell**                   | [Nushell][Nushell] + [Starship][Starship]                                                                         | [Nushell][Nushell] + [Starship][Starship]                                                                         |
| **Music Player**            | [mpd][mpd], [ncmpcpp][ncmpcpp], [mpc][mpc], [Netease-cloud-music-gtk][netease-cloud-music-gtk]                    | [Netease-cloud-music-gtk][netease-cloud-music-gtk]                                                                |
| **Media Player**            | [mpv][mpv]                                                                                                        | [mpv][mpv]                                                                                                        |
| **Text Editor**             | [Neovim][Neovim] + [DoomEmacs][DoomEmacs]                                                                         | [Neovim][Neovim] + [DoomEmacs][DoomEmacs]                                                                         |
| **Fonts**                   | [Nerd fonts][Nerd fonts]                                                                                          | [Nerd fonts][Nerd fonts]                                                                                          |
| **Image Viewer**            | [imv][imv]                                                                                                        | [imv][imv]                                                                                                        |
| **Screenshot Software**     | [flameshot][flameshot] + [grim][grim]                                                                             | [flameshot][flameshot]                                                                                            |
| **Screen Recording**        | [OBS][OBS]                                                                                                        | [OBS][OBS]                                                                                                        |
| **Filesystem & Encryption** | tmpfs on `/`, [Btrfs][Btrfs] subvolumes on a [LUKS][LUKS] crypted partition for persistent, unlock via passphrase | tmpfs on `/`, [Btrfs][Btrfs] subvolumes on a [LUKS][LUKS] crypted partition for persistent, unlock via passphrase |
| **Secure Boot**             | [lanzaboote][lanzaboote]                                                                                          | [lanzaboote][lanzaboote]                                                                                          |
## Philosophy and design principles

Simplicity... as a simple person with simple requirements, I sought to craft a NixOS config to daily drive on my old Dell laptop.
Here is a quick explanation of the folder structure. This "project" is a [flake](https://zero-to-nix.com/concepts/flakes) as you 
might have noticed. The home directory contains my [home-manager](https://github.com/nix-community/home-manager) configuration for apps
like Firefox, Spotify etc. The system directory holds system-level configs, like the hostname, etc. You can also configure the
Nix package manager from there. And that's just about it. Simple, right?


## How to Install?
First of all, you're not supposed to install my NixOS config on your computer. I didn't have that kind of sharing in mind when I wrote
these configs. You should cherry-pick the `.nix` files that you're interested in. Let's say you admire my Cava setup and you'd
like to have it as part of your system... you'd simply copy my [home/cava.nix](home/cava.nix) file into **your** config directory, and then import it.
However, if you're still adamant about installing my configs on your machine, or would like to fork my flake, follow the steps below.

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
' > system/sys.nix
```

If you've made it this far, run

```bash
sudo nixos-rebuild boot --flake .# && reboot
```

Finally, I will mention that the instructions above were never tested. If you actually succeed, let me know... lol.
If you need help with your NixOS config, contact me via Discord [here](). I'm not very good at Nix though... so we might end up
looking for a third person to help.


### I stole about 30 percent of the code in this repo from the following sources:

- [Aylur/dotfiles](https://github.com/Aylur/dotfiles) - Several dozen snippets, Helix config, UEFI boot stuff for the instructions above
- [NotAShelf/Nyx](https://github.com/NotAShelf/Nyx) - I took hundreds of snippets from their ultra-complex setup
- [Misterio77/nix-config](https://github.com/Misterio77/nix-config) - Firefox declaration with addons, Helix config
- [rubyowo/dotfiles](https://github.com/rubyowo/dotfiles) - Catppuccin themes for CLI tools like bat, cava etc. Copied as is, without modification. Thank you!
- [Zaney/zaneyos](https://gitlab.com/Zaney/zaneyos) - Several snippets & Nixvim although I no longer use it


#### Learning resources
- [NixOS and Flakes Book/](https://nixos-and-flakes.thiscute.world/)
- [Xe's blog](https://xeiaso.net/blog)
- [NixOS Discord](https://discord.com/invite/2HeKRM3)
- [Zaney's Blog](https://zaney.org/)
- [nix.dev](https://nix.dev)