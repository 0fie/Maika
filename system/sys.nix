{ pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    # Hardware acceleration.
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
      driSupport = true;
      driSupport32Bit = true;
    };
    enableRedistributableFirmware = true;
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
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
