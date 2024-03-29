{ pkgs, inputs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    #charm-freeze
    gimp # for making memes. Please suggest a lighter alternative.
    git-extras # Provides useful commands like git-summary
    libreoffice
    loupe # image viewer
    mpv-unwrapped # lightweight media player
    protonvpn-gui
    shotcut # lightweight video cutter
    soundwireserver # cast sound to Android phone.
    transmission-gtk # torrent client
    vokoscreen-ng # screen recorder (buggy on Wayland)

    inputs.catppuccinifier.packages.${pkgs.system}.cli
  ];
}
