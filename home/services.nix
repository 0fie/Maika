{ ... }:

{
  services = {
    network-manager-applet.enable = true;
    blueman-applet.enable = true;

    hypridle = {
      enable = true;
      lockCmd = "hyprlock";
      unlockCmd = "notify-send ''";
      beforeSleepCmd = "notify-send ''";
      afterSleepCmd = "notify-send ''";
      ignoreDbusInhibit = false;

      listeners = [
        {
          timeout = 600;
          onTimeout = "hyprlock";
          onResume = "";
        }
        {
          timeout = 1200;
          onTimeout = "systemctl suspend";
          onResume = "notify-send 'welcome back!'";
        }
      ];
    };
  };
}
