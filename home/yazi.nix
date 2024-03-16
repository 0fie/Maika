{ config, pkgs, ... }: {
  programs.yazi = {
    enable = true;
    package = pkgs.yazi-unwrapped;
    enableNushellIntergration = true;
    keymap = { };
    settings = { };
    theme = { };
  };
}
