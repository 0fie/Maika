{
  config,
  pkgs,
  lib,
  ...
}: let
  scripts = import ./scripts.nix {inherit pkgs;};
in {
  services = {
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
          onTimeout = "${scripts.suspendScript}/bin/script";
        }
      ];
    };
  };
}
