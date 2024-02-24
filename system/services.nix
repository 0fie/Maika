{ config, pkgs, ... }:

{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    blueman.enable = true;
    fstrim.enable = true; # Trim SSDs in the background.
    devmon.enable = true;
    udisks2.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal ];
    configPackages = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal ];
  };
}
