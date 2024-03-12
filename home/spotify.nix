{ pkgs, ... }:

{
  home.packages = with pkgs; [ spotify ];
  # TODO: Make the app use a Catppuccin colorscheme.
}
