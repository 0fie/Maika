{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
    };
    plymouth = {
      enable = true;
    };
    initrd.availableKernelModules = [ "ehci_pci" "ahci" "xhci_pci" "ums_realtek" "usb_storage" "sd_mod" "sr_mod" ];
    kernelModules = [ "kvm-intel" ];
  };

  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/f554d441-3e59-452a-bad7-e1cb9ef2fef5";
    fsType = "ext4";
  };

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };
}
