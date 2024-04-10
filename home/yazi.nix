{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    package = pkgs.yazi-unwrapped;
    enableNushellIntegration = true;
    settings = {
      manager = {
        show_hidden = false;
        sort_by = "alphabetical";
        sort_dir_first = true;
      };
      headsup.disable_exec_warn = true;
      plugin.prepend_previewers = [
        {
          name = "*.md";
          run = "glow";
        }
      ];
    };
  };

  home.packages = with pkgs; [
    exiftool
    fd
    ffmpegthumbnailer
    file
    glow
    jq
    poppler
    ripgrep
    unar
  ];

  xdg.configFile = {
    "yazi/theme.toml".text = builtins.readFile (pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/yazi-rs/flavors/main/catppuccin-mocha.yazi/flavor.toml";
      hash = "sha256-T9uehViMJWU/mXYoKsdA1v7Z7R/Pg8svWogTUUqnaa0=";
    });

    "yazi/plugins/smart-enter.yazi/init.lua".text = ''
      return {
      	entry = function()
      		local h = cx.active.current.hovered
      		ya.manager_emit(h and h.cha.is_dir and "enter" or "open", { hovered = true })
      	end,
      }
    '';
  };
}
