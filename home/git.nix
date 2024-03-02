{ config, pkgs, ... }:

{
  programs.git = rec {
    enable = true;
    userName = "0fie";
    userEmail = "151028199+0fie@users.noreply.github.com";
    extraConfig = {
      user.defaultBranch = "main";
      color.ui = true;
      core.editor = "nvim";
      credential.helper = "store";
      github.user = userName;
      push.autoSetupRemote = true;
    };
  };
}
