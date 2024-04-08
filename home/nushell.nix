{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (import ./options.nix) dotfilesDir;
in {
  programs = {
    direnv = {
      enable = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };

    nushell = {
      enable = true;
      loginFile.text = ''
        if (tty) == "/dev/tty1" {
          exec Hyprland
        }
      '';

      shellAliases = let
        g = lib.getExe pkgs.git;
      in {
        # Git
        ga = "${g} add";
        gc = "${g} commit";
        gd = "${g} diff";
        gl = "${g} log";
        gs = "${g} status";
        gp = "${g} push origin main";

        # ETC.
        c = "clear";
        f = "${pkgs.yazi-unwrapped}/bin/yazi";
        la = "ls -la";
        ll = "ls -l";
        n = "${pkgs.nitch}/bin/nitch";
        nv = "nvim";

        # Nix
        nrs = "sudo sh -c 'nixos-rebuild switch --flake ${dotfilesDir}/.# |& ${pkgs.nix-output-monitor}/bin/nom'";
        hrs = "home-manager switch --flake ${dotfilesDir}";
        nlu = "nix flake lock --update-input";

        # Modern yuunix, uwu <3
        cat = "${pkgs.bat}/bin/bat";
        cp = "${pkgs.advcpmv}/bin/advcp -g"; # Shows progress bar.
        df = "${pkgs.duf}/bin/duf";
        find = "${pkgs.fd}/bin/fd";
        grep = "${pkgs.ripgrep}/bin/rg";
        mv = "${pkgs.advcpmv}/bin/advmv -g"; # Also shows progress bar.
        tree = "${pkgs.eza}/bin/eza --git --icons --tree";
      };

      environmentVariables = {
        PROMPT_INDICATOR_VI_INSERT = ''"  "'';
        PROMPT_INDICATOR_VI_NORMAL = ''"∙ "'';
        PROMPT_COMMAND = ''""'';
        PROMPT_COMMAND_RIGHT = ''""'';
        DIRENV_LOG_FORMAT = ''""''; # make direnv quiet
        SHELL = ''"${pkgs.nushell}/bin/nu"'';
        EDITOR = ''"nvim"'';
      };

      # See the Nushell docs for more options.
      extraConfig = let
        conf = builtins.toJSON {
          show_banner = false;
          edit_mode = "vi";
          shell_integration = true;

          ls.clickable_links = true;
          rm.always_trash = true;

          table = {
            mode = "rounded";
            index_mode = "always";
            header_on_separator = false;
          };

          cursor_shape = {
            vi_insert = "line";
            vi_normal = "block";
          };

          menus = [
            {
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
            }
          ];
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
        ${completions ["git" "nix" "man"]}

        def --env ff [...args] {
        	let tmp = (mktemp -t "yazi-cwd.XXXXX")
        	yazi ...$args --cwd-file $tmp
        	let cwd = (open $tmp)
        	if $cwd != "" and $cwd != $env.PWD {
        		cd $cwd
        	}
        	rm -fp $tmp
        }

          source /home/0fie/.config/nushell/extra.nu
      '';
    };
  };
}
