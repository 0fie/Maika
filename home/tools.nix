{ pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    gimp
    git-extras # Provides useful commands like git-summary
    iotop
    killall
    libreoffice
    loupe # image viewer
    persepolis # download manager
    protonvpn-gui
    shotcut # lightweight video cutter
    soundwireserver # cast sound to Android phone. Or use it as a bluetooth speaker!
    transmission-gtk # torrent client
    vlc
    vokoscreen-ng # screen recorder
    which
  ];
}
