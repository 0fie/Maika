{ config, pkgs, ... }:

let
  batteryScript = pkgs.writeShellScriptBin "script.sh" ''
    currentBatteryPercentage=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ $currentBatteryPercentage -ge 101 ]; then
      echo "100"
    else
      echo $currentBatteryPercentage
    fi
  '';
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
	layer = "top";
	position = "top";
	height = 18;
	modules-left = [ "custom/logo" "hyprland/workspaces"];
	modules-center = [];
	modules-right = [ "custom/battery" "clock" ];

	"custom/logo" = {
	  exec = "echo ' '";
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
          exec = "${batteryScript}/bin/script.sh";
          format = " 󰁹 {}";
          interval = 10;
        };

        clock = {
  	  format = "󰥔 {:%H:%M}";
  	  tooltip-format = ''
  	    <span size='9pt' font='WenQuanYi Zen Hei Mono'>{calendar}</span>
	  '';
  	  calendar = {
  	    format = {
  	      days = "<span color='#ecc6d9'><b>{}</b></span>";
  	      months = "<span color='#ffead3'><b>{}</b></span>";
  	      today = "<span color='#ff6699'><b><u>{}</u></b></span>";
  	      weekdays = "<span color='#ffcc66'><b>{}</b></span>";
  	      weeks = "<span color='#99ffdd'><b>W{}</b></span>";
  	    };
  	    mode = "year";
  	    mode-mon-col = 3;
  	    on-click-right = "mode";
  	    on-scroll = 1;
  	    weeks-pos = "right";
  	  };
        };
      };
    };
  };
}
