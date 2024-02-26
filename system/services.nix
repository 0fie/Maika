{ config, pkgs, ... }:

{
  services = {
    gvfs.enable = true; # Adds functionality to nautilus file manager.
    gnome.gnome-keyring.enable = true;
    blueman.enable = true;  # GUI Bluetooth manager.
    fstrim.enable = true;   # Trim SSDs in the background.
    devmon.enable = true;   # Monitor for new storage devices.
    udisks2.enable = true;  # Allow apps to query and manipulate storage devices.
  };

  xdg.portal = {
    # These allow basic Desktop capabillities like screensharing and 'drag and drop'.
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal ];
    configPackages = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal ];
  };
}
