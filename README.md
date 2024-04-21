<h1 align="center">
   <img src="https://github.com/0fie/Maika/assets/151028199/6da7fe65-6661-4bb6-b5bc-b72aa6d79a7a" width="100px" /> 
   <br>
      0fie's ultra-simple NixOS config 
   <br>
      <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br>
   <div align="center">

   <div align="center">
      <p></p>
      <div align="center">
         <a href="https://github.com/0fie/Maika/stargazers">
            <img src="https://img.shields.io/github/stars/0fie/Maika?color=F5BDE6&labelColor=303446&style=for-the-badge&logo=starship&logoColor=F5BDE6">
         </a>
         <a href="https://github.com/0fie/Maika/">
            <img src="https://img.shields.io/github/repo-size/0fie/Maika?color=C6A0F6&labelColor=303446&style=for-the-badge&logo=github&logoColor=C6A0F6">
         </a>
         <a = href="https://nixos.org">
            <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=303446&logo=NixOS&logoColor=white&color=91D7E3">
         </a>
         <a href="https://github.com/0fie/Maika/blob/main/LICENSE">
            <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=313244&colorB=F5A97F&logo=unlicense&logoColor=F5A97F&"/>
         </a>
      </div>
      <br>
   </div>
</h1>

<br>
</div>

<p align="center">
   <img src="https://github.com/0fie/Maika/blob/main/docs/images/rice/v1/rice.png" width="800px" /> <br>
</p>
<p align="center">
   Screenshot last updated <b>20 March</b>
</p>

### 🖼️ Gallery

<details>
   <summary>
      Current (Expand)
   </summary>
   <p align="center">
      Kitty + Nushell + Starship + Cava
      <img src="https://github.com/0fie/Maika/blob/main/docs/images/rice/v1/term.png" width="800px" /> <br>
   </p>

   <p align="center">
      Hyprlock (lock screen)
      <img src="https://github.com/0fie/Maika/blob/main/docs/images/rice/v1/lock.png" width="800px" /> <br>
   </p>
   <p align="center">
      App Launcher (rofi-wayland)
      <img src="https://github.com/0fie/Maika/blob/main/docs/images/rice/v1/rofi.png" width="800px" /> <br>
   </p>
   <p align="center">
      Helix Editor (left) and Yazi (right)
      <img src="https://github.com/0fie/Maika/blob/main/docs/images/rice/v1/cli.png" width="800px" /> <br>
   </p>

</details>

<details>
  <summary>Next version</summary>
  <p align="center">
    V2 (work in progress)
    <img src="https://github.com/0fie/Maika/blob/main/docs/images/rice/v2/home.png" /> <br>
</details>

<details>
  <summary>More Pics</summary>
  <p>Just kidding, please star the repo lol lol 😅</p>
</details>

### 📓 Components

| Type                    |                         Program                          |
| ----------------------- | :------------------------------------------------------: |
| **Compositor**          |                   [Hyprland][Hyprland]                   |
| **Lock screen**         |                   [Hyprlock][Hyprlock]                   |
| **Idle Mgmt. Daemon**   |                   [Hypridle][Hypridle]                   |
| **Wallpaper Setter**    |                  [Hyprpaper][Hyprpaper]                  |
| **Text Editor**         |                     [Neovim][Neovim]                     |
| **Shell**               |        [Nushell][Nushell] + [Starship][Starship]         |
| **Terminal Emulator**   |                      [Kitty][Kitty]                      |
| **Font**                |                   [MonoLisa][MonoLisa]                   |
| **File Manager**        |                       [Yazi][Yazi]                       |
| **RSS Reader**          |                      [Izrss][Izrss]                      |
| **Color Scheme**        |                 [Catppuccin][Catppuccin]                 |
| **Screenshot Software** |                  [Grimblast][Grimblast]                  |
| **Bar**                 |                     [Waybar][Waybar]                     |
| **Cursor**              |          [Bibata-Modern-Ice][Bibata-Modern-Ice]          |
| **Folder Icons**        | [catppuccin-papirus-folders][catppuccin-papirus-folders] |
| **Image Viewer**        |                      [Loupe][Loupe]                      |

<br>

### 📚 Directory Structure

| File/Dir                  |                           What it does                            |
| ------------------------- | :---------------------------------------------------------------: |
| [flake.nix](flake.nix) ❄️ |                     base of the configuration                     |
| [home/](home/) 🏠️        |      contains home-manager configs for the user, like themes      |
| [system/](system/) ⚙️     |     contains system-level OS configs like file system & boot.     |
| [docs/](docs/) 📚️        | the documentation: explains how to do x, what option y does, etc. |

<br>

### Why it looks like this?

Simplicity. As a simple person with simple requirements, I sought to craft a beautiful and functional NixOS + Hyprland config to daily
drive on my old Dell laptop, and this is it! It meets my needs perfectly, and there is nothing more to add to it. You will notice that
the [home](home/) and [system](system/) directories do not contain any additional directories inside them. This was intentionally done
to avoid unnecessary complexity. You can open an [issue](https://github.com/0fie/Dotfiles/issues/new) if you face trouble with the dotfiles.

<br>

### How to Install?

You should cherry-pick the parts that you're interested in. For example, if you want to add my Hyprland config to your setup, you'd simply
copy my [home/hyprland.nix](./home/hyprland.nix) file into your dotfiles directory and then import it. There are also some
[docs/](./docs/README.md) which explain how to install this entire home-manager config. But don't bother reading if you are not
[0fie](https://github.com/0fie).

<br>

### I got a lot of inspiration as well as actual code from the following sources:

- [Frost-Phoenix/nixos-config](Frost-Phoenix/nixos-config) - Configs for Starship, Waybar & Hyprland window rules
- [Aylur/dotfiles](https://github.com/Aylur/dotfiles) - Nushell configs
- [isabelroses/dotfiles](https://github.com/isabelroses/dotfiles/) - Catppuccin for SDDM

### Other learning resources that have also been helpful

- [NixOS and Flakes Book](https://nixos-and-flakes.thiscute.world)
- [Zero to Nix](https://zero-to-nix.com)
- [Vimjoyer's Nix playlist](https://www.youtube.com/playlist?list=PLko9chwSoP-15ZtZxu64k_CuTzXrFpxPE)

###### Special thanks to [NobbZ](https://github.com/NobbZ) for answering all my questions on Discord.

<p align="center"><a href="https://github.com/0fie/Maika?tab=readme-ov-file#readme"><small>back to top</small></a></p>

<!-- links -->

[Hyprland]: https://github.com/hyprwm/Hyprland
[Kitty]: https://github.com/kovidgoyal/kitty
[Starship]: https://github.com/starship/starship
[Waybar]: https://github.com/Alexays/Waybar
[grimblast]: https://github.com/hyprwm/contrib
[Catppuccin]: https://github.com/catppuccin/catppuccin
[catppuccin-papirus-folders]: https://github.com/catppuccin/papirus-folders
[Nushell]: https://www.nushell.sh
[Neovim]: https://neovim.io
[Yazi]: https://github.com/sxyazi/yazi
[Hypridle]: https://github.com/hyprwm/hypridle
[Hyprlock]: https://github.com/hyprwm/hyprlock
[Hyprpaper]: https://github.com/hyprwm/hyprpaper
[Bibata-Modern-Ice]: https://github.com/ful1e5/Bibata_Cursor
[Loupe]: https://apps.gnome.org/Loupe/
[MonoLisa]: https://monolisa.dev
[Izrss]: https://github.com/isabelroses/izrss
