{ ... }:

{
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
  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.loader.grub.enableCryptodisk=true;
  boot.initrd.luks.devices."luks-ad25b88c-d338-4d0f-a1f6-145c0c451cc0".keyFile = "/crypto_keyfile.bin";

  # Do not change this unless you truly understand what you're doing. It's actually fine as it is.
  system.stateVersion = "23.05";
}
