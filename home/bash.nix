{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      nv = "nvim";
      rbs = "sudo nixos-rebuild switch";
    };
  };
}
