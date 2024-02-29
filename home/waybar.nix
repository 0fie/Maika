{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
	position = "top";
	height = 8;
	modules-left = [ "custom/logo" "hyprland/workspaces"];
	modules-center = [];
	modules-right = [ "custom/battery" "clock" ];

	"custom/logo" = {
	  exec = "echo ''";
	  format = "{}";
        };

	"hyprland/workspaces" = {
          format = "{icon}";
	  persistent-workspaces = {
	    "*" = 1;
	  };
          format-icons = {
            active = "";
            default = "";
            urgent = "";
          };
          on-click = "activate";
        };

        "custom/battery" = {
          exec = pkgs.writeShellScript "battery" ''
	    percentage=$(cat /sys/class/power_supply/BAT0/capacity)
    	    if [ $percentage -ge 100 ]; then
    	      echo "100" # My battery reports over 356% when full. It is broken.
    	    else
    	      echo $percentage
    	    fi
	  '';
          format = "󰁹 {}";
          interval = 10;
        };

        clock = {
  	  format = "󰥔 {:%H:%M}";
  	  tooltip-format = ''
  	    <span size='9pt' font='WenQuanYi Zen Hei Mono'>{calendar}</span>
	  '';
  	  # calendar = {
  	  #   format = {
  	  #     days = "<span color='#ecc6d9'><b>{}</b></span>";
  	  #     months = "<span color='#ffead3'><b>{}</b></span>";
  	  #     today = "<span color='#ff6699'><b><u>{}</u></b></span>";
  	  #     weekdays = "<span color='#ffcc66'><b>{}</b></span>";
  	  #     weeks = "<span color='#99ffdd'><b>W{}</b></span>";
  	  #   };
  	  #   mode = "year";
  	  #   mode-mon-col = 3;
  	  #   on-click-right = "mode";
  	  #   on-scroll = 1;
  	  #   weeks-pos = "right";
  	  # };
        };
      };
    };

    style = ''
      * {
	border: none;
	border-radius: 0;
	min-height: 0;
        font-family: "JetBrainsMono Nerd Font";
	font-size: 13px;
	font-weight: bold;
      }

      #clock, #custom-battery, #workspaces, #custom-logo {
	background-color: #313244;
	border-radius: 12px;
	margin: 4px;
	padding: 2px 10px;
        transition: all 0.2s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #custom-logo {
	color: #89b4fa;
	padding-right: 15px;
	font-size: 120%;
      }

      #clock {
	color: #cba6f7;
      }

      #battery {
        color: #a6e3a1;
      }

      #workspaces {
	color: #f5c2e7;
      }
    '';
  };
}
