{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (import ./scripts.nix {inherit pkgs;}) suspendScript;
in {
  services = {
    udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };

    network-manager-applet.enable = true;
    blueman-applet.enable = true;

    hypridle = rec {
      enable = true;
      lockCmd = lib.getExe config.programs.hyprlock.package;
      beforeSleepCmd = "${pkgs.systemd}/bin/loginctl lock-session";
      ignoreDbusInhibit = false;

      listeners = [
        {
          timeout = 600;
          onTimeout = lockCmd;
        }
        {
          timeout = 1200;
          onTimeout = "${suspendScript}/bin/script";
        }
      ];
    };
  };
}
