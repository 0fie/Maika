{ pkgs, inputs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    gcc
    gimp
    git-extras # Provides useful commands like git-summary
    iotop
    killall
    libreoffice
    loupe # image viewer
    mpv-unwrapped
    persepolis # download manager
    protonvpn-gui
    shotcut # lightweight video cutter
    soundwireserver # cast sound to Android phone.
    transmission-gtk # torrent client
    vokoscreen-ng # screen recorder
    which

    inputs.catppuccinifier.packages.${pkgs.system}.cli
  ];
}
