{ ... }:

{
  imports = [
    ./boot.nix
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

  # Do not change this unless you truly understand what you're doing. It's actually fine as it is.
  system.stateVersion = "23.05";
}
