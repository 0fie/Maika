{ ... }:

# Fetch the stateVersion variable from our system's options.nix file.
let inherit (import ./options.nix) stateVersion;
in {
  imports = [
    ./boot.nix
    ./environment.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./kernel.nix
    ./locale.nix
    ./networking.nix
    ./nix-settings.nix
    ./services.nix
    ./systemd.nix
    ./sound.nix
    ./sys.nix
    ./users.nix
  ];

  # Do not change this unless you truly understand what you're doing. It's actually fine as it is.
  system.stateVersion = "${stateVersion}";
}
