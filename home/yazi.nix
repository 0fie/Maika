{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi-unwrapped;
    enableNushellIntegration = true;
    keymap = { };
    settings = { };
    theme = { };
  };
}
