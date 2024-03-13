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

  # tmpfs on /tmp for speed and less strain on SSD/HDD during builds.
  fileSystems = {
    "/tmp" = {
      device = "none";
      fsType = "tmpfs";
      options = [ "defaults" "size=30%" "mode=755" ];
    };
  };
}
