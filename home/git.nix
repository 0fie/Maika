{ config, pkgs, ... }:

let inherit (import ./options.nix) gitUserName gitEmail;

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
