{ inputs, ... }:

# Fetches the user's name from home/options.nix
# And then fetches the system's stateVersion from system/options.nix
# HM's stateVersion should be in sync with the system's stateVersion to avoid mismatches and conflicts.
let
  inherit (import ./options.nix) userName;
  inherit (import ../system/options.nix) stateVersion;

in {
  imports = [
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./firefox.nix
    ./git.nix
    ./gtk.nix
    ./helix.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./kitty.nix
    ./mako.nix
    ./nautilus.nix
    ./nushell.nix
    ./pyprland.nix
    ./rofi.nix
    ./services.nix
    ./starship.nix
    ./tools.nix
    ./waybar.nix
    ./xdg.nix
    ./yazi.nix
    inputs.hyprland.homeManagerModules.default
    inputs.hypridle.homeManagerModules.hypridle
    inputs.hyprlock.homeManagerModules.hyprlock
    inputs.nix-colors.homeManagerModules.default
  ];

  # Info required by home-manager.
  home = {
    username = "${userName}";
    homeDirectory = "/home/${userName}";
    stateVersion = "${stateVersion}";
  };

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  programs.home-manager.enable = true;
}
