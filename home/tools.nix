{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    aria2
    discord
    exiftool
    file
    keepassxc
    lf
    loupe
    mono
    nodejs_21
    vlc
    which
    yarn
  ];
}
