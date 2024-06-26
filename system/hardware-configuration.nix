# ###############################################
#
# WARNING: This hardware configuration is almost certainly not suitable for your machine.
# You can generate your own HW config by overriding the contents of this file, like so:
#...
#   nixos-generate-config --show-hardware-config > system/hardware-configuration.nix
#...
#
# To copy & paste the command above as is, without modification, you'd need to be in the Maika directory (or the root of wherever you cloned this repo into),
# or '../' (from this file).
# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];
  boot = {
    initrd.availableKernelModules = ["ehci_pci" "ahci" "xhci_pci" "ums_realtek" "sd_mod" "sr_mod"];
    initrd.kernelModules = [];
    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
  };

  # tmpfs for /tmp is safely declared in system/sys.nix
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp9s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
