{ config, pkgs, ... }:

{
  services = {
    network-manager-applet.enable = true;
    blueman-applet.enable= true;

    hypridle = {
      enable = true;
      ignoreDbusInhibit = false;
      listeners = [{
          timeout = 600;
          onTimeout = "hyprlock & sleep 600; systemctl suspend";
          onResume = "notify-send 'Welcome back! 🙂'";
      }];
    };
  };
}
