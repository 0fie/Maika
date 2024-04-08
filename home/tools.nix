{
  pkgs,
  inputs,
  ...
}: {
  # Additional packages that should be installed to the user profile.
  home.packages = with pkgs; [
    #charm-freeze
    jetbrains-toolbox
    git-extras # Provides useful commands like git-summary
    loupe # image viewer
    mpv-unwrapped # lightweight media player
    protonvpn-gui # at least it's open source
    soundwireserver # cast sound to Android phone.
    vokoscreen-ng # screen recorder (extremely buggy on Wayland)

    inputs.mika.packages.${system}.default # my neovim flake.
  ];
}
