{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    catppuccin.enable = true;
    package = pkgs.yazi-unwrapped;
    enableNushellIntegration = true;
    settings = {
      manager = {
        show_hidden = false;
        sort_by = "alphabetical";
        sort_dir_first = true;
        prepend_keymap = [
          {
            on = ["f" "g"];
            run = "plugin fg";
            desc = "Find file by content";
          }
          {
            on = ["f" "f"];
            run = "plugin fg --args='fzf'";
            desc = "find file by file name";
          }
        ];
      };
      headsup.disable_exec_warn = false;
      plugin.prepend_previewers = [
        {
          name = "*.md";
          run = "glow";
        }
      ];
    };
  };

  home.packages = with pkgs; [
    exiftool # To get exif data of files.
    fd
    ffmpegthumbnailer # For thumbnails.
    file
    fzf # For fg.yazi plugin.
    glow # For previewing markdown files.
    jq # For previewing JSON files.
    poppler
    ripgrep # For fg.yazi plugin.
    unar # for previewing archive files.
  ];

  xdg.configFile = {
    "yazi/plugins/glow.yazi".source = pkgs.fetchFromGitHub {
      owner = "Reledia";
      repo = "glow.yazi";
      rev = "54b34c2b337ab0933130a06f61038398efa9ce65";
      hash = "sha256-YTe76i5pdw0GhzWGBU41FDAKy3PJR7aPQgn+dbXHPNg=";
    };

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
