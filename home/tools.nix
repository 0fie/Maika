{ pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    gimp
    git-extras
    iotop
    killall
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
