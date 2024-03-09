{ config, ... }:

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

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };
}
