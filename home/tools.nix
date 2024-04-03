{
  pkgs,
  inputs,
  ...
}: {
  # Additional packages that should be installed to the user profile.
  home.packages = with pkgs; [
    burpsuite # to be replaced with Postman.
    #charm-freeze
    git-extras # Provides useful commands like git-summary
    libreoffice # Is there a lighter alternative?
    loupe # image viewer
    mpv-unwrapped # lightweight media player
    protonvpn-gui # at least it's open source
    soundwireserver # cast sound to Android phone.
    vokoscreen-ng # screen recorder (buggy on Wayland)

    inputs.catppuccinifier.packages.${pkgs.system}.cli # Applies Catppuccin flavors to images.
    inputs.mika.packages.${system}.default # my neovim flake.
  ];
}
