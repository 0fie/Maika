{pkgs, ...}: {
  services = {
    # Devmon monitors for new storage devices. Udisks2 allows apps like Nautilus to query and manipulate
    # storage devices. Gnome-keyring enables apps to display an auth dialog when attempting to perform privileged operations,
    # like mounting another partition.
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    gnome.gnome-keyring.enable = true;
    blueman.enable = true; # GUI Bluetooth manager.

    # Trim SSD in the background, once every month.
    # You can set this to "weekly";
    fstrim = {
      enable = true;
      interval = "monthly";
    };

    # I'm on a laptop. Adjust this to your liking.
    logind = {
      lidSwitch = "suspend";
      powerKey = "suspend";
      powerKeyLongPress = "reboot";
    };
  };

  xdg.portal = with pkgs; {
    # These enable basic Desktop capabilities like screen-sharing and 'drag and drop'.
    enable = true;
    extraPortals = [xdg-desktop-portal-gtk xdg-desktop-portal];
    configPackages = [xdg-desktop-portal-gtk xdg-desktop-portal-hyprland xdg-desktop-portal];
  };
}
