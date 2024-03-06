{ config, pkgs, ... }:

let
  usr = import ../options.nix;
  gitUserName = usr.gitUserName;
  gitEmail = usr.gitEmail;

in {
  programs.git = rec {
    enable = true;
    userName = "${gitUserName}";
    userEmail = "${gitEmail}";
    extraConfig = {
      user.defaultBranch = "main";
      color.ui = true;
      core.editor = "nvim";
      credential.helper = "store";
      github.user = gitUserName;
      push.autoSetupRemote = true;
    };
  };
}
