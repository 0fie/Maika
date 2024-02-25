{ config, pkgs, ... }:

let currentWall = builtins.readFile (pkgs.fetchFromGitHub {
  owner = "0fie";
  repo = "wallpapers";
  rev = "main";
  sha256 = "sha256-ZxerPKmhaX0pWe3aNtZBZ0fpLDy4vPB3qGQe1cRRDn8=";
} + "/images/winter-wall2.png");

in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        "col.active_border" = "rgba(${config.colorScheme.palette.base0E}ff) rgba(${config.colorScheme.palette.base09}ff) 60deg";
        layout = "master";
      };

      env = [
        "XCURSOR_SIZE,11"
      ];

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "grp:alt_shift_toggle,caps:escape";
        kb_rules = "";
        touchpad = {
          natural_scroll = false;
        };

        repeat_rate = 40;
        repeat_delay = 250;
        force_no_accel = true;
        sensitivity = 0.0; # -1.0 - 1.0, 0 means no modification.
        follow_mouse = 1;
      };

      misc = {
        enable_swallow = true;
        force_default_wallpaper = 0;
        # swallow_regex = "^(Alacritty|wezterm)$";
      };

      decoration = {
        rounding = 5;
        drop_shadow = true;
        shadow_range = 30;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.25, 0.9, 0.1, 1.02";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 3, default, slidevert"
          "workspaces, 1, 3, myBezier, slidefadevert"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = false;
      };

      # Using the Super key (windows button) as the main mod.
      "$mainMod" = "SUPER";

      bind = [
        # Launch apps
        "$mainMod,        r,   exec,   ${pkgs.rofi-wayland}/bin/rofi -show drun -show-icons"
	"$mainMod,        e,   exec,   ${pkgs.emote}/bin/emote"
	"$mainMod,        b,   exec,   ${pkgs.firefox}/bin/firefox"
	"$mainMod,        f,   exec,   ${pkgs.gnome.nautilus}/bin/nautilus"
	"$mainMod,        s,   exec,   ${pkgs.spotify}/bin/spotify"
	"$mainMod,        k,   exec,   ${pkgs.keepassxc}/bin/keepassxc"
        "$mainMod,   return,   exec,   ${pkgs.kitty}/bin/kitty"

        # Close a window o quit Hyprland.
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT, M, exit,"

	# Toggle window states.
        "$mainMod SHIFT, f, togglefloating,"
        "$mainMod, F, fullscreen,"

	# Move focus from one window to another.
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

	# Move window to either the left, right, top, or bottom.
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"
      ]
        # WTF is this? I don't understand Nix code. 😿
        ++ map (n: "$mainMod SHIFT, ${toString n}, movetoworkspace, ${toString (
          if n == 0
          then 10
          else n
        )}") [1 2 3 4 5 6 7 8 9 0]
        ++ map (n: "$mainMod, ${toString n}, workspace, ${toString (
          if n == 0
          then 10
          else n
        )}") [1 2 3 4 5 6 7 8 9 0];

      binde = [
        # Move windows.
        "$mainMod SHIFT, h, moveactive, -20 0"
        "$mainMod SHIFT, l, moveactive, 20 0"
        "$mainMod SHIFT, k, moveactive, 0 -20"
        "$mainMod SHIFT, j, moveactive, 0 20"

        # Resize windows.
        "$mainMod CTRL, l, resizeactive, 30 0"
        "$mainMod CTRL, h, resizeactive, -30 0"
        "$mainMod CTRL, k, resizeactive, 0 -10"
        "$mainMod CTRL, j, resizeactive, 0 10"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging.
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
	 "hyprctl ${pkgs.hyprpaper}/bin/hyprpaper preload '${currentWall}'"
	 "hyprctl ${pkgs.hyprpaper}/bin/hyprpaper wallpaper ',${currentWall}'"
        "${pkgs.waybar}/bin/waybar &"
	"${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 & "
      ];
    };
  };
}
