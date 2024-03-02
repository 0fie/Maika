{ config, lib, pkgs, ... }:

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
    "/" = { 
      device = "/dev/disk/by-uuid/f554d441-3e59-452a-bad7-e1cb9ef2fef5";
      fsType = "ext4";
    };

    "/tmp" = { 
      #device = "/dev/disk/by-uuid/f554d441-3e59-452a-bad7-e1cb9ef2fef5";
      fsType = "tmpfs";
    };
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };

  # OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
