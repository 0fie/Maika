{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./firefox.nix
    ./git.nix
    ./gtk.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./kitty.nix
    ./lf.nix
    ./mako.nix
    ./nautilus.nix
    ./neofetch.nix
    ./nixvim.nix
    ./pyprland.nix
    ./rofi.nix
    ./services.nix
    ./spotify.nix
    ./starship.nix
    ./tools.nix
    ./waybar.nix
    ./xdg.nix
    ./zathura.nix
    ./zsh.nix
    inputs.hyprland.homeManagerModules.default
    inputs.hypridle.homeManagerModules.hypridle
    inputs.hyprlock.homeManagerModules.hyprlock
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
  ];

  # Info required by home-manager.
  home = {
    username = "me";
    homeDirectory = "/home/me";
    stateVersion = "23.11";

    sessionVariables = {
      GST_PLUGIN_SYSTEM_PATH_1_0 =
        lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0" [
          pkgs.gst_all_1.gst-plugins-good
          pkgs.gst_all_1.gst-plugins-bad
          pkgs.gst_all_1.gst-plugins-ugly
          #pkgs.gst_all_1.gst-plugins-libav
        ];
      NIXOS_OZONE_WL = "1";
      ELECTRON_USE_WAYLAND = "1";
    };
  };

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  programs.home-manager.enable = true;
}
