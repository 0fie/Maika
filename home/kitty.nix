# Fetch the fontName variable from system/options.nix to determine which font to use.
let
  inherit (import ../system/options.nix) fontName;
in {
  home.sessionVariables.TERMINAL = "kitty";

  programs.kitty = {
    enable = true;
    catppuccin.enable = true;
    shellIntegration.enableBashIntegration = true;
    font.name = "${fontName}";
    font.size = 11;
    settings = {
      background_opacity = "1";
      enable_audio_bell = "no";

      cursor_text_color = "background";

      window_padding_width = 4;

      listen_on = "unix:/tmp/kitty";
      shell_integration = "enabled";
    };
  };
}
