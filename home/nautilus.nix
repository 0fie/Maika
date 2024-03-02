{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ gnome.nautilus ];
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };
  };

  #programs.nautilus-open-any-terminal = {
  #  enable = true;
  #  terminal = "kitty";
  #};
}
