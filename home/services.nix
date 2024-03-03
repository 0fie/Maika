{ config, pkgs, ... }:

{
  services = {
    network-manager-applet.enable = true;
    blueman-applet.enable= true;

    hypridle = rec {
      enable = true;
      lockCmd = "hyprlock";
      unlockCmd = "notify-send 'Welcome back! 🙂'";
      beforeSleepCmd = "notify-send ''";
      afterSleepCmd = "notify-send ''";
      ignoreDbusInhibit = false;

      listeners = [{
          timeout = 600;
          onTimeout = "${lockCmd} & sleep 600; systemctl suspend";
          onResume = "notify-send 'Welcome back! 🙂'";
      }];
    };
  };
}
