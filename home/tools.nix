{ pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    exiftool
    file
    gimp
    git-extras
    iotop
    keepassxc
    libreoffice
    loupe
    persepolis
    protonvpn-gui
    shotcut
    transmission-gtk
    vlc
    vokoscreen-ng
    which
  ];
}
