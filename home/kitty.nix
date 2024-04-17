# Fetch the fontName variable from system/options.nix to determine which font to use.
let
  inherit (import ../system/options.nix) fontName;
in {
  home.sessionVariables.TERMINAL = "kitty";

  programs.kitty = {
    enable = true;
    catppuccin.enable = true;
    font = {
      name = "${fontName}";
      size = 11;
    };
    settings = {
      background_opacity = "1"; # Hyprland will set a uniform opacity for all apps. See home/Hyprland.nix
      enable_audio_bell = "no";
      cursor_text_color = "background";
      window_padding_width = 4;
      listen_on = "unix:/tmp/kitty";
    };
  };
}
