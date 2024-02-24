{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "0fie";
    userEmail = "mitesh@makosa.dev";
    extraConfig = {
      user = {
        defaultBranch = "main";
      };
    };
  };
}
