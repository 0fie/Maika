{inputs, ...}:
# Fetches the user's name from home/options.nix
# And then fetches the system's stateVersion from system/options.nix
# HM's stateVersion should be in sync with the system's stateVersion to avoid mismatches and conflicts.
let
  inherit (import ./options.nix) userName;
  inherit (import ../system/options.nix) stateVersion;
in {
  imports = [
    ./cli.nix
    ./files.nix
    ./firefox.nix
    ./git.nix
    ./gtk.nix
    ./izrss.nix
    ./nushell.nix
    ./nix-settings.nix
    ./starship.nix
    ./tools.nix
    ./xdg.nix
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.izrss.homeManagerModules.default
  ];

  # Info required by home-manager and some session variables.
  home = {
    username = "${userName}";
    homeDirectory = "/home/${userName}";
    stateVersion = "${stateVersion}";
  };

  news.display = "silent";
  catppuccin.flavour = "mocha";
  programs.home-manager.enable = true;
}
