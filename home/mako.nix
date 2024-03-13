{ config, pkgs, ... }:

let inherit (import ../system/options.nix) fontName;
in {
  home.packages = with pkgs; [ libnotify ];

  services.mako = {
    enable = true;
    font = "${fontName}";
    margin = "0,20,20";
    padding = "10";
    borderSize = 2;
    borderRadius = 5;
    defaultTimeout = 10000;
    groupBy = "summary";
    iconPath = "${config.gtk.iconTheme.package}/share/icons/Papirus-Dark";

    backgroundColor = "#24273a";
    textColor = "#cad3f5";
    borderColor = "#f5bde6";
    progressColor = "#363a4f";
  };
}
