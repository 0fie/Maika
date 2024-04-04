{
  config,
  pkgs,
  inputs,
  ...
}: {
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        size = "standard";
        variant = "mocha";
      };
    };
    cursorTheme.name = "default";
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "pink";
      };
      name = "Papirus-Dark";
    };
  };

  # Symlink the `~/.config/gtk-4.0/` folder declaratively to theme GTK-4 apps as well.
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  # The bibata-cursors package in nixpkgs downloads over 400MB worth of assets. I only need the 2MB "modern-ice".
  # I don't know if or how the package can be overriden. So this is a quick hack to save my time and bandwidth.
  home.file.".icons/default" = {
    source = "${inputs.trash}/My-Bibata-Modern-Ice";
  };
  home.file.".local/share/fonts" = {source = "${inputs.trash}/fonts";};
}
