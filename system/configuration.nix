{ config, pkgs, ... }:

{
  imports = [
    ./environment.nix
    ./fonts.nix
    ./hardware.nix
    ./networking.nix
    ./nix-settings.nix
    ./locale.nix
    ./services.nix
    ./systemd.nix
    ./sound.nix
    ./users.nix
  ];

  system.stateVersion = "23.05";
}
