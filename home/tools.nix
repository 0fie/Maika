{ pkgs, inputs, ... }:

{
  # Additional packages that should be installed to the user profile.
  home.packages = with pkgs; [
    #charm-freeze
    git-extras # Provides useful commands like git-summary
    libreoffice # Is there a lighter alternative?
    loupe # image viewer
    mpv-unwrapped # lightweight media player
    protonvpn-gui
    soundwireserver # cast sound to Android phone.
    vokoscreen-ng # screen recorder (buggy on Wayland)

    inputs.catppuccinifier.packages.${pkgs.system}.cli
  ];
}
