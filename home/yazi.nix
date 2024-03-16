{ pkgs, inputs, ... }:

{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi-unwrapped;
    enableNushellIntegration = true;
    keymap = { };
    settings = {
      manager = {
        show_hidden = false;
        sort_by = "alphabetical";
        sort_dir_first = true;
      };
    };
    theme = { };
  };

  home.packages = with pkgs; [ ffmpegthumbnailer unar poppler fd ripgrep ];
  xdg.configFile."yazi/theme.toml".text =
    builtins.readFile "${inputs.yazi-theme}/catppuccin-mocha/theme.toml";
}
