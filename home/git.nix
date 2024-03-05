{ config, pkgs, ... }:

let
  info = import ../options.nix;
  gitUserName = info.user.gitUserName;
  gitEmail = info.user.gitEmail;

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
      github.user = userName;
      push.autoSetupRemote = true;
    };
  };
}
