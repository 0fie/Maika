{ config, pkgs, inputs, ... }:

{
  imports = [
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./env.nix
    ./firefox.nix
    ./git.nix
    ./gtk.nix
    ./hyprland.nix
    ./kitty.nix
    ./lf.nix
    ./mako.nix
    ./nixvim.nix
    ./rofi.nix
    ./spotify.nix
    ./starship.nix
    ./tools.nix
    ./waybar.nix
    ./xdg.nix
    ./zathura.nix
    ./zsh.nix
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
  ];

  # Info required by home-manager.
  home = {
    username = "me";
    homeDirectory = "/home/me";
    stateVersion = "23.11";
  };

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;
  programs.home-manager.enable = true;
}
