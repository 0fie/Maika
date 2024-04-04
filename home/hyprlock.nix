{pkgs, ...}:
# Fetch the fontName variable from system/options.nix to determine which font to use.
let
  inherit (import ../system/options.nix) fontName;

  # TODO: Replace this with proper Catppuccin colors.
  placeholderAndTimeColor = "rgb(205, 214, 244)";
in {
  programs.hyprlock = {
    enable = true;
    general = {
      hide_cursor = true;
      disable_loading_bar = false;
      no_fade_in = false;
    };

    # The background image is fetched from GitHub. I don't store my wallpapers locally.
    backgrounds = [
      {
        monitor = "";
        path = toString (pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/0fie/Wallpapers/main/images/cat-leaves.png";
          sha256 = "sha256-kegUK62YtI7G3P/pIqcWdFGlqN4S1/4xOOmOboPxJKE=";
        });
      }
    ];

    input-fields = [
      {
        size = {
          width = 300;
          height = 40;
        };
        outline_thickness = 2;
        outer_color = "rgb(69, 71, 90)";
        inner_color = placeholderAndTimeColor;
        font_color = "rgb(127, 132, 156)";
        fade_on_empty = false;
        placeholder_text = "password...";
        dots_spacing = 0.3;
        dots_center = true;
      }
    ];

    labels = [
      {
        monitor = "";
        text = "$TIME";
        font_family = "${fontName}";
        font_size = 50;
        color = placeholderAndTimeColor;
        position = {
          x = 0;
          y = 70;
        };
        valign = "center";
        halign = "center";
      }
    ];
  };
}
# Thanks to Fufexan for creating these amazing home-manager modules.

