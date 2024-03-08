{ config, pkgs, ... }:

{
  services = {
    devmon.enable = true; # 1. Monitors for new storage devices.
    gvfs.enable = true; # 2. Adds functionality to nautilus file manager.
    udisks2.enable =
      true; # 3. Allow apps to query and manipulate storage devices.

    gnome.gnome-keyring.enable = true;
    blueman.enable = true; # GUI Bluetooth manager.

    fstrim = {
      enable = true; # Trim SSDs in the background.
      interval = "monthly";
    };
  };

  xdg.portal = {
    # These allow basic Desktop capabillities like screensharing and 'drag and drop'.
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
    ];
  };
}
