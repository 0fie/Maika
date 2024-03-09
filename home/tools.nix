{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    aria2
    exiftool
    file
    git-extras
    #iotop
    keepassxc
    lf
    loupe
    nixfmt
    nodePackages.prettier
    protonvpn-gui
    vlc
    vokoscreen-ng
    which
  ];
}
