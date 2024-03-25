# How to do X?

### How to change color scheme
Open [home/home.nix]() in your editor. Jump to line 42 and modify the line to your liking.
Possible values (themes) can be found at [nix-colors](https://github.com/misterio77/nix-colors).

 ```
colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
```

Bat and Btop manually fetch their themes from GitHub. See [home/bat.nix](../home/bat.nix) and [home/btop.nix](../home/btop.nix)
To change the theme used by GTK apps, see [home/gtk.nix](). For QT, see [home/qt.nix](../home/qt.nix)