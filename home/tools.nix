{ pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    exiftool
    file
    gimp
    git-extras
    iotop
    #jetbrains.rider
    keepassxc
    libreoffice
    loupe
    persepolis
    protonvpn-gui
    shotcut
    soundwireserver
    transmission-gtk
    vlc
    vokoscreen-ng
    which
  ];
}
