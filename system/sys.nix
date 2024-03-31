{ pkgs, ... }:

# In this file, we have hardware acceleration, bluetooth & tmpfs for /tmp

{
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  hardware = {
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

    # Enable & configure BT.
    bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings.General = {
        FastConnectable = true;
        JustWorksRepairing = "always";
        Experimental = true; # Battery info for Bluetooth devices
      };
    };
  };

  # Laptop's fan go brrrr.
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };

  # tmpfs on /tmp for speed and less strain on SSD/HDD during builds.
  fileSystems."/tmp" = {
    device = "none";
    fsType = "tmpfs";
    options = [ "defaults" "size=30%" "mode=755" ];
  };
}
