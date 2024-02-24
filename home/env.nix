{ config, pkgs, ... }:

{
  home.sessionVariables = {
    GIT_EDITOR = "nvim";
    TERMINAL = "kitty";
  };
};
