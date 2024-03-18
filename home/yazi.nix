{ pkgs, inputs, ... }:

{
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
      headsup = { disable_exec_warn = true; };
      plugin = {
        prepend_previewers = [{
          name = "*.md";
          run = "glow";
        }];
      };
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
    "yazi/theme.toml".text =
      builtins.readFile "${inputs.yazi-theme}/catppuccin-mocha/theme.toml";

    "yazi/plugins/glow.yazi".source = "${inputs.yazi-glow}";

    "yazi/plugins/smart-enter.yazi/init.lua".text = # lua
      ''
        return {
        	entry = function()
        		local h = cx.active.current.hovered
        		ya.manager_emit(h and h.cha.is_dir and "enter" or "open", { hovered = true })
        	end,
        }
      '';
  };
}
