# TODO: Setup fuzzy finding and interpolate cli tools in scripts.
{ pkgs, ... }:

{
  programs.lf = {
    enable = true;
    commands = { editor-open = ''$$EDITOR "$f"''; };

    keybindings = {
      m = "push %mkdir<space>";
      t = "push %touch<space>";
      r = "push :rename<space>";
      x = "delete";
      "." = "set hidden!";
      z = "zip";
      Z = "unzip";
      f = "fzf";

      p = "paste";
      dd = "cut";
      y = "copy";
      "<enter>" = "open";
      R = "reload";
      U = "unselect";

      gd = "cd ~/Downloads";
      gc = "cd ~/.config";
      gp = "cd ~/Projects";
      gm = "cd /run/media";
      gn = "cd /etc/nixos";

      e = "editor-open";
      V = ''''$${pkgs.bat}/bin/bat --paging=always "$f"'';

      "<C-d>" = "5j";
      "<C-u>" = "5k";
    };

    settings = {
      scrolloff = 5;
      reverse = false;
      preview = true;
      hidden = false;
      drawbox = false;
      icons = true;
      ignorecase = true;
    };

    extraConfig = let
      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        ${pkgs.ctpv}/bin/ctpvclear
        ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
      '';
    in ''
      # set cleaner ''${pkgs.ctpv}/bin/ctpvclear
      set cleaner ${cleaner}/bin/clean.sh
      set previewer ${pkgs.ctpv}/bin/ctpv
      cmd stripspace %stripspace "$f"
      setlocal ~/Projects/* sortby time
      setlocal ~/Downloads/ sortby time
    '';
  };

  xdg.configFile."lf/icons".text = builtins.readFile (pkgs.fetchFromGitHub {
    owner = "0fie";
    repo = "trash";
    rev = "main";
    sha256 = "sha256-psXD7z1UecJo7E1ocFFWe3QDRVbaF+dDzhmuXtvsPo8=";
  } + "/icons");

  # TODO: LF should not have a desktop entry
  # xdg.desktopEntries = {
  #   "lf" = {
  #     exec = "";
  #     name = "LF";
  #     settings.NoDisplay = "true";
  #   };
  # };
}
