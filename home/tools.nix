{ pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    audacity
    gimp
    git-extras
    iotop
    jetbrains-toolbox
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
