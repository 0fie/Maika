{ ... }:

# This is kept in a separate file to allow you to copy the system/sys.nix file as it is.
{
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };
}
