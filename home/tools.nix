{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    aria2
    exiftool
    file
    gnome.nautilus
    keepassxc
    lf
    mono
    neofetch
    nodejs_21
    vlc
    which
    yarn
  ];
}
