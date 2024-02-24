{ config, pkgs, ... }:

{
  imports = [
    ./environment.nix
    ./fonts.nix
    ./hardware.nix
    ./networking.nix
    ./nix-settings.nix
    ./locale.nix
    ./sound.nix
    ./users.nix
  ];

  programs.hyprland.enable = true;
  programs.zsh.enable = true;
  system.stateVersion = "23.05";
}
