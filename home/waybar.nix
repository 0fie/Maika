{ config, pkgs, ... }:

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
	modules-right = [ "battery" "clock" ];

	"custom/logo" = {
	  exec = "echo ' '";
	  format = "{}";
        };

	"hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
            urgent = "";
          };
          on-click = "activate";
        };

	"battery" = {
	  bat = "BAT0";
	  interval = 60;
	  states = {
	    warning = 30;
	    critical = 15;
	  };
	  format = "{capacity%} {icon}";
	  format-icons = [ "" "" "" "" "" ];
	};

      };
    };
  };
}
