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
      plugin = builtins.fromTOML ''
        prepend_previewers = [
          { name = "*.md", run = "glow" },
        ]
      '';
    };
  };

  home.packages = with pkgs; [
    exiftool
    file
    ffmpegthumbnailer
    unar
    poppler
    fd
    ripgrep
    glow
  ];

  xdg.configFile = {
    "yazi/theme.toml".text =
      builtins.readFile "${inputs.yazi-theme}/catppuccin-mocha/theme.toml";
    "yazi/plugins/glow/init.lua".text =
      builtins.readFile "${inputs.yazi-glow}/init.lua";
  };
}
