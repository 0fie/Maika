{
  services = {
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
