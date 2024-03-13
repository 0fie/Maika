{ pkgs, ... }:

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

  fileSystems = {
    "/tmp" = {
      device = "none";
      fsType = "tmpfs";
      options = [ "defaults" "size=30%" "mode=755" ];
    };
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };
}
