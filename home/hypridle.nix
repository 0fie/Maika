{ config, pkgs, ... }:

{
  services.hypridle = {
    enable = true;
    ignoreDbusInhibit = false;

    listeners = [
      {
        timeout = 600;
        onTimeout = "hyprlock";
        onResume = "notify-send 'Welcome back!'";
      }
      {
	timeout = 1200;
	onTimeout = "systemctl suspend";
	onResume = "notify-send 'Welcome back! 🙂";
      }
    ];
  };
}
