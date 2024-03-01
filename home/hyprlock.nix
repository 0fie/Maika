{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;
    general = {
      hide_cursor = true;
    };

    backgrounds = [
      {
        monitor = "";
        path = toString( pkgs.fetchurl {
	  url = "https://raw.githubusercontent.com/0fie/wallpapers/main/Art/mountain.png";
	  sha256 = "sha256-8LmAIexewsIDpTg8ijm5dnhV+477kFAG8e7FeqEvh0Y=";
	});
      }
    ];

    input-fields = [
      {
        size = {
          width = 300;
          height = 50;
        };

        outline_thickness = 2;

        outer_color = "rgb(000000)";
        inner_color = "rgb(200, 200, 200)";
        font_color = "rgb(10, 10, 10)";
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
	font_family = "JetBrains Mono Nerd Font";
        font_size = 50;
        color = "rgb(200, 200, 200)";

        position = {
          x = 0;
          y = 80;
        };

        valign = "center";
        halign = "center";
      }
    ];
  };
}
