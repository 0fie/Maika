{pkgs, ...}:
# In this file, we have hardware acceleration, bluetooth & tmpfs for /tmp
{
  hardware = {
    # Hardware acceleration.
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-vaapi-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
      driSupport = true;
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
    options = ["defaults" "size=30%" "mode=755"];
  };
}
