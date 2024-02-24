## TODO: Make GTK themes work. Maybe generate them from nix-colors?
#{ config, pkgs, ... }:
#
#{
#  gtk = {
#    enable = true;
#    theme = {
#      name = "Catppuccin-Mocha-Compact-Blue-Dark";
#      package = pkgs.catppuccin-gtk.override {
#        accents = [ "pink" ];
#        size = "compact";
#        tweaks = [ "rimless" "black" ];
#        variant = "mocha";
#      };
#    };
#    iconTheme = {
#      package = pkgs.catppuccin-papirus-folders.override {
#        flavor = "mocha";
#        accent = "pink";
#      };
#      name = "Papirus-Dark";
#    };
#    font = {
#      name = "JetbrainsMono Nerd Font";
#      size = 12;
#    };
#  };
#
#  xdg.configFile = {
#    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
#    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
#    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
#  };
#}
{ pkgs, config, gtkThemeFromScheme, ... }:

{
  # Configure Cursor Theme
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  # Theme GTK
  gtk = {
    enable = true;
    font = {
      name = "Ubuntu";
      size = 12;
      package = pkgs.ubuntu_font_family;
    };
    theme = {
      name = "${config.colorScheme.slug}";
      package = gtkThemeFromScheme {scheme = config.colorScheme;};
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
  };

  # Theme QT -> GTK
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
    };
  };
}
