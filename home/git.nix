{ config, ... }:

# Fetch the user's Git email & username from home/options.nix
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
      help.autocorrect = 10;
    };

    # Files/Dirs that should not be tracked
    ignores = [
      "target/"
      ".cache/"
      ".idea/"
      "*.elc"
      ".~lock*"
      "auto-save-list"
      "result"
      "result-*"

      # Web dev stuff
      "node_modules/"

      # Direnv stuff
      ".envrc"
      ".direnv/"

      # My TO-DO list
      ".TODO.md"
    ];
  };
}
