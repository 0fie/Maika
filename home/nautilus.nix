{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ gnome.nautilus ];

  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };
  };

  # Refer to system/services.nix
  # The first 3 services in that file give additional functionality to Nautilus.
}
