{ config, pkgs, inputs, ... }:

{
  imports = [
    ./bat.nix
    ./bash.nix
    ./btop.nix
    ./cava.nix
    ./eza.nix
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

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  programs.home-manager.enable = true;
}
