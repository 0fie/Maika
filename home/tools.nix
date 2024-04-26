{pkgs, ...}: {
  # Additional packages that should be installed to the user profile.
  home.packages = with pkgs; [
    charm-freeze
    exercism
    git-extras # Provides useful commands like git-summary
    haruna
    jetbrains-toolbox
    keepassxc
    nix-inspect # Interactive TUI for inspecting nix configs.
    nix-prefetch-scripts # utils for getting sha256 of URLs and git repos
    protonvpn-gui # at least it's open source
    rustup
    spotify
    vesktop
    vscode
  ];
}
