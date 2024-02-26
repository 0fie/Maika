{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    aria2
    btop
    cava
    exiftool
    file
    github-desktop
    gnome.nautilus
    keepassxc
    lf
    neofetch
    which
  ];
}
