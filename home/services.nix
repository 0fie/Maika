{ config, pkgs, ... }:

{
  services = {
    network-manager-applet.enable = true;
    blueman-applet.enable= true;

    hypridle = {
      enable = true;
      lockCmd = "hyprlock";
      unlockCmd = "notify-send ''";
      beforeSleepCmd = "notify-send ''";
      afterSleepCmd = "notify-send ''";
      ignoreDbusInhibit = false;

      listeners = [{
        timeout = 1200;
        onTimeout = "hyprlock & sleep 60; systemctl suspend";
        onResume = "notify-send 'Welcome back! 🙂'";
      }];
    };
  };
}
