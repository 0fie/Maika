{ pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    exiftool
    file
    git-extras
    iotop
    keepassxc
    lf
    libreoffice
    loupe
    nodePackages.prettier
    persepolis
    protonvpn-gui
    shotcut
    transmission-gtk
    vlc
    vokoscreen-ng
    which
  ];
}
