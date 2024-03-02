{ config, pkgs, ... }:

{
  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
    };
    plymouth = {
      enable = true;
    };
  };

  fileSystems = {
    "/tmp" = { 
      fsType = "tmpfs";
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
