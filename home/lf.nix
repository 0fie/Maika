{ pkgs, config, lib, ... }:

{
  programs.lf = {
    enable = true;
    commands = {
      drag-out = ''%${pkgs.ripdrag}/bin/ripdrag -a -x "$fx"'';
      editor-open = ''$$EDITOR "$f"'';
      edit-dir = ''$$EDITOR .'';
      mkdirfile = ''
        ''${{
            printf "File: "
            read DIR
            mk $DIR
        }}
      '';

      #on-cd = ''
      #  ''${{ }}
      #'';
    };
    keybindings = {
      "\\\"" = "";
      o = "";
      d = "";
      e = "";
      f = "";
      c = "mkdirfile";
      "." = "set hidden!";
      D = "delete";
      p = "paste";
      dd = "cut";
      y = "copy";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";
      a = "rename";
      r = "reload";
      C = "clear";
      U = "unselect";

      do = "drag-out";

      "g~" = "cd";
      gh = "cd";
      "g/" = "/";
      gd = "cd ~/Downloads";
      gt = "cd /tmp";
      gv = "cd ~/Videos";
      go = "cd ~/Documents";
      gc = "cd ~/.config";
      gn = "cd ~/nixconf";
      gp = "cd ~/Projects";
      gs = "cd ~/.local/share";
      gm = "cd /run/media";

      ee = "editor-open";
      "e." = "edit-dir";
      V = ''''$${pkgs.bat}/bin/bat --paging=always "$f"'';

      "<C-d>" = "5j";
      "<C-u>" = "5k";
    };

    settings = {
      reverse = false;
      preview = true;
      hidden = false;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

    extraConfig = let
      previewer = pkgs.writeShellScriptBin "pv.sh" ''
        file=$1
        w=$2
        h=$3
        x=$4
        y=$5

        if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
            ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
            exit 1
        fi

        ${pkgs.pistol}/bin/pistol "$file"
      '';
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

  # I want the entire lf config to be in 1 file. One lf.nix file
  # Dont ask why.
  xdg.configFile."lf/icons".text = builtins.readFile (pkgs.fetchFromGithub {
    owner = "0fie";
    repo = "trash";
    rev = "main";
    sha256 = lib.fakeSha256;
  } + "/hosts");
}
