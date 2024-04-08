{pkgs, ...}:
# Fetch the fontName variable from system/options.nix to determine which font to use.
let
  inherit (import ./scripts.nix {inherit pkgs;}) waybarTemperatureScript;
  inherit (import ../system/options.nix) fontName;
in {
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      position = "top";
      layer = "top";
      height = 5;
      margin-top = 0;
      margin-bottom = 0;
      margin-left = 0;
      margin-right = 0;
      modules-left = ["custom/launcher" "hyprland/workspaces"];
      modules-center = ["clock"];
      modules-right = ["cpu" "custom/temperature" "pulseaudio" "tray"];

      clock = {
        calendar = {
          format = {today = "<span color='#b4befe'><b>{}</b></span>";};
        };
        format = " {:%H:%M}";
        tooltip = "true";
        tooltip-format = ''
          <big>{:%Y %B}</big>
          <tt><small>{calendar}</small></tt>'';
        format-alt = " {:%d/%m}";
      };

      "hyprland/workspaces" = {
        active-only = false;
        disable-scroll = true;
        format = "{icon}";
        on-click = "activate";
        format-icons = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
          "10" = "0";
          sort-by-number = true;
        };
      };

      "custom/temperature" = {
        exec = "${waybarTemperatureScript}/bin/script";
        format = "{}°C";
        interval = 1;
      };

      cpu = {
        format = " {usage}%";
        format-alt = "  {avg_frequency} GHz";
        interval = 1;
      };

      tray = {
        icon-size = 20;
        spacing = 8;
      };

      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = "󰖁 ";
        format-icons = {default = [" "];};
        scroll-step = 5;
        on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
      };

      "custom/launcher" = {
        format = "";
        on-click = "pkill rofi || ${pkgs.rofi-wayland}/bin/rofi -show drun -show-icons";
        tooltip = "false";
      };
    };

    style = let
      custom = {
        font = "${fontName}";
        font_size = "15px";
        font_weight = "bold";
        text_color = "#cdd6f4";
        secondary_accent = "89b4fa";
        tertiary_accent = "f5f5f5";
        background = "11111B";
        opacity = "0.98";
      };
      # css
    in ''
      * {
          border: none;
          border-radius: 0px;
          padding: 0;
          margin: 0;
          min-height: 0px;
          font-family: ${custom.font};
          font-weight: ${custom.font_weight};
          opacity: ${custom.opacity};
      }

      window#waybar {
          background: none;
      }

      #workspaces {
          font-size: ${custom.font_size};
          padding-left: 15px;
      }
      #workspaces button {
          color: ${custom.text_color};
          padding-left:  6px;
          padding-right: 6px;
      }
      #workspaces button.empty {
          color: #6c7086;
      }
      #workspaces button.active {
          color: #b4befe;
      }

      #tray, #pulseaudio, #network, #cpu, #custom-temperature, #disk, #clock {
          font-size: ${custom.font_size};
          color: ${custom.text_color};
      }

      #cpu {
          font-size: ${custom.font_size};
          padding-left: 9px;
          padding-right: 9px;
          margin-left: 7px;
      }
      #custom-temperature {
          font-size: ${custom.font_size};
          padding-left: 9px;
          padding-right: 9px;
      }

      #tray {
          padding: 0 16px;
          padding-right: 12px;
          margin-left: 7px;
      }

      #pulseaudio {
          font-size: ${custom.font_size};
          padding-left: 15px;
          padding-right: 9px;
          margin-left: 7px;
      }
      #network {
          padding-left: 9px;
          padding-right: 15px;
      }

      #clock {
          padding-left: 9px;
          padding-right: 15px;
      }

      #custom-launcher {
          font-size: 18px;
          color: #b4befe;
          font-weight: ${custom.font_weight};
          padding-left: 10px;
          padding-right: 12px;
      }
    '';
  };
}
