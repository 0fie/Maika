{ ... }:

# TODO: These configs should only be used if the users' full name is 0fie.
{
  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
    };
    plymouth = { enable = true; };
  };
}
