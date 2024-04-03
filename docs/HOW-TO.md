### How to change color scheme

Open [home/home.nix](../home/home.nix) in your editor. Locate the line starting with `colorScheme` at the bottom of the file and modify
it to your liking. Possible values (themes) can be found at [nix-colors](https://github.com/misterio77/nix-colors).

```
# For Catppuccin mocha
colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

# For Catppuccin frappe
colorScheme = inputs.nix-colors.colorSchemes.catppuccin-frappe;
```

Bat and Btop fetch their themes from GitHub. See [home/cli.nix](../home/cli.nix). To change the theme used by GTK apps, see
[home/gtk.nix](../home/gtk.nix).
