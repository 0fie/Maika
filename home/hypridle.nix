{ config, pkgs, ... }:

{
  services.hypridle = {
    enable = true;
    ignoreDbusInhibit = true;

    listeners = [
      {
        timeout = 6;
        onTimeout = "hyprlock";
        onResume = "notify-send 'Welcome back!'";
      }
      {
	timeout = 900;
	onTimeout = "systemctl suspend";
	onResume = "notify-send 'Welcome back! 🙂";
      }
    ];
  };
}
