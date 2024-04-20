{
  services = {
    devmon.enable = true; # Monitors for new storage devices.
    gvfs.enable = true;
    udisks2.enable = true; # allows apps to query and manipulate storage devices.
    gnome.gnome-keyring.enable = true;
    blueman.enable = true; # GUI Bluetooth manager.

    # Trim SSD in the background, once every week.
    fstrim = {
      enable = true;
      interval = "weekly";
    };

    # I'm on a laptop. Adjust this to your liking.
    logind = {
      lidSwitch = "suspend";
      powerKey = "suspend";
      powerKeyLongPress = "reboot";
    };
  };
}
