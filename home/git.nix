{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "0fie";
    userEmail = "151028199+0fie@users.noreply.github.com";
    extraConfig = {
      user = {
        defaultBranch = "main";
      };
    };
  };
}
