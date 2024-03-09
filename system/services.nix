{ config, pkgs, ... }:

{
  services = {
    # Devmon monitors for new storage devices. Udisks2 allows apps like Nautilus to query and manipulate
    # storage devices. Gnome-keyring enables allows apps to display an auth dialog to perform adminstrative
    # operations, like mounting another partition.
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    gnome.gnome-keyring.enable = true;
    blueman.enable = true; # GUI Bluetooth manager.

    fstrim = {
      enable = true; # Trim SSD in the background, once every month.
      interval = "monthly";
    };
  };

  xdg.portal = with pkgs; {
    # These allow basic Desktop capabillities like screensharing and 'drag and drop'.
    enable = true;
    extraPortals = [ xdg-desktop-portal-gtk xdg-desktop-portal ];
    configPackages =
      [ xdg-desktop-portal-gtk xdg-desktop-portal-hyprland xdg-desktop-portal ];
  };
}
