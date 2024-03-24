{ pkgs, inputs, ... }:

{
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  home.packages = with pkgs; [ spotify ];

  programs.spicetify =
    let spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
    in {
      enable = true;

      theme = spicePkgs.themes.catppuccin;

      colorScheme = "mocha";

      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        history
        genre
        hidePodcasts
        shuffle
      ];
    };
}
