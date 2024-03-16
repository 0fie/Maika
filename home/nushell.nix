{ config, pkgs, inputs, ... }:

let
  inherit (import ./options.nix) dotfilesDir;
  scripts = import ./scripts.nix { inherit pkgs; };
in {
  programs.nushell = {
    enable = true;
    loginFile.text = ''
      if (tty) == "/dev/tty1" {
        exec Hyprland
      }
    '';
    shellAliases = {
      # ETC.
      c = "clear";
      Done = "${scripts.notifyDone}/bin/script";
      la = "ls -la";
      ll = "ls -l";
      mf = "bash ${inputs.trash}/maxfetch.sh";
      f = "${pkgs.yazi-unwrapped}/bin/yazi";

      # Git
      ga = "${pkgs.git}/bin/git add";
      gc = "${pkgs.git}/bin/git commit";
      gl = "${pkgs.git}/bin/git log";
      gs = "${pkgs.git}/bin/git status";
      gp = "${pkgs.git}/bin/git push origin main";

      # Nix
      nrs = "sudo nixos-rebuild switch --flake ${dotfilesDir}/.#";

      # Modern yuunix, uwu <3
      cat = "${pkgs.bat}/bin/bat";
      cp = "${pkgs.advcpmv}/bin/advcp -g";
      df = "${pkgs.duf}/bin/duf";
      find = "${pkgs.fd}/bin/fd";
      grep = "${pkgs.ripgrep}/bin/rg";
      mv = "${pkgs.advcpmv}/bin/advmv -g";
      tree = "${pkgs.eza}/bin/eza --git --icons --tree";
    };

    environmentVariables = {
      PROMPT_INDICATOR_VI_INSERT = ''"  "'';
      PROMPT_INDICATOR_VI_NORMAL = ''"∙ "'';
      PROMPT_COMMAND = ''""'';
      PROMPT_COMMAND_RIGHT = ''""'';
      DIRENV_LOG_FORMAT = ''""'';
      SHELL = ''"${pkgs.nushell}/bin/nu"'';
      EDITOR = config.home.sessionVariables.EDITOR;
    };

    extraConfig = let
      conf = builtins.toJSON {
        show_banner = false;
        edit_mode = "vi";
        shell_integration = true;

        ls.clickable_links = true;
        rm.always_trash = true;

        table = {
          mode = "rounded"; # compact thin rounded
          index_mode = "always"; # alway never auto
          header_on_separator = false;
        };

        cursor_shape = {
          vi_insert = "line";
          vi_normal = "block";
        };

        menus = [({
          name = "completion_menu";
          only_buffer_difference = false;
          marker = "? ";
          type = {
            layout = "columnar"; # list, description
            columns = 4;
            col_padding = 2;
          };
          style = {
            text = "magenta";
            selected_text = "blue_reverse";
            description_text = "yellow";
          };
        })];
      };
      completion = name: ''
        source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/${name}/${name}-completions.nu
      '';
      completions = names:
        builtins.foldl' (prev: str: ''
          ${prev}
          ${str}'') "" (map (name: completion name) names);
    in ''
      $env.config = ${conf};
      ${completions [ "git" "nix" "npm" ]}

      def --env ff [...args] {
      	let tmp = (mktemp -t "yazi-cwd.XXXXX")
      	yazi ...$args --cwd-file $tmp
      	let cwd = (open $tmp)
      	if $cwd != "" and $cwd != $env.PWD {
      		cd $cwd
      	}
      	rm -fp $tmp
      }
    '';
  };
}
