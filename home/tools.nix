{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    aria2
    discord
    exiftool
    file
    gnome.nautilus
    keepassxc
    lf
    loupe
    mono
    neofetch
    nodejs_21
    vlc
    which
    yarn
  ];
}
