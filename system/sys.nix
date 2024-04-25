# In this file, we have hardware acceleration and tmpfs for /tmp
{
  hardware.enableRedistributableFirmware = true;

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
