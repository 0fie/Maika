#### How theming works?

I use [Catppuccin](https://github.com/catppuccin) system-wide, from GRUB to Hyprland. To ensure that all apps follow this color scheme, I'm
using [catppuccin/nix](https://github.com/catppuccin/nix). Inspect [home/home.nix](../home/home.nix) to see how I used it. To change the
theme used by GTK apps, see [home/gtk.nix](../home/gtk.nix).

#### How fonts work?

The [system/options.nix](../system/options.nix) contains a variable called `fontName`. Apps like Kitty, Mako & Waybar read this variable to
determine which font to use. It is **not** the actual font that will get installed. It just exists to let apps know what font to search for.
Installing the actual font package is your responsibility. Suppose you want to switch to the Iosevka font system-wide; you'd first install the
font like so:

```nix
home.packages = [pkgs.iosevka];

# Or alternatively
fonts.packages = [pkgs.iosevka];
```

And then modify the `fontName` variable in [system/options.nix](../system/options.nix) to make your Iosevka the default font everywhere.
