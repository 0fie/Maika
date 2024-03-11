{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    exiftool
    file
    git-extras
    iotop
    keepassxc
    lf
    loupe
    nodePackages.prettier
    persepolis
    protonvpn-gui
    vlc
    vokoscreen-ng
    which
  ];
}
