{ config, pkgs, ... }:

{
  services.hypridle = {
    enable = true;
    general = {
      lockCmd = "";
      unlock_cmd = "notify-send 'Unlocked...'";
      before_sleep_cmd = "";
      after_sleep_cmd = "notify-send 'We're back! 🙂'";
      ignore_dbus_inhibit = false;
    };

    #listener = {
    #  timeout = 500;
    #  on-timeout = "hyprlock";
    #  on-resume = notify-send "Welcome back!";
    #};
  };
}
