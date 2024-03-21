{ config, ... }:

let inherit (import ./options.nix) gitUserName gitEmail;

in {
  programs.git = {
    enable = true;
    userName = "${gitUserName}";
    userEmail = "${gitEmail}";
    extraConfig = {
      init.defaultBranch = "main";
      color.ui = true;
      core.editor = "${config.home.sessionVariables.EDITOR}";
      credential.helper = "store";
      github.user = gitUserName;
      push.autoSetupRemote = true;
    };
  };
}
