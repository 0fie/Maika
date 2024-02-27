{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    aria2
    btop
    cava
    exiftool
    file
    gnome.nautilus
    keepassxc
    lf
    mono
    neofetch
    which
  ];
}
