{
  pkgs,
  inputs,
  ...
}: {
  # Additional packages that should be installed to the user profile.
  home.packages = with pkgs; [
    charm-freeze
    jetbrains-toolbox
    git-extras # Provides useful commands like git-summary
    loupe # image viewer
    mpv-unwrapped # lightweight media player
    gnome.nautilus # GUI file manager
    protonvpn-gui # at least it's open source

    inputs.mika.packages.${pkgs.system}.default # my neovim flake
  ];
}
