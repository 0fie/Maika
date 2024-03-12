{ ... }:

{
  imports = [
    ./environment.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./networking.nix
    ./nix-settings.nix
    ./locale.nix
    ./services.nix
    ./systemd.nix
    ./sound.nix
    ./sys.nix
    ./users.nix
  ];

  system.stateVersion = "23.05";
}
