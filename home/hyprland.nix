{ config, pkgs, ... }:

let
  currentWallpaper = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/0fie/wallpapers/main/images/catppuccin.jpg";
    sha256 = "sha256-bMYij70tl4RmzGLnsmcjg6wtBDVnL71gO9ox6g2MUcs=";
  };
  hyprpaperConf = pkgs.writeText "hyprpaper.conf" ''
    preload = ${currentWallpaper}
    wallpaper = ,${currentWallpaper}
  '';
  scripts = import ./scripts.nix { inherit pkgs; };
in {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" =
          "rgba(${config.colorScheme.palette.base0E}ff) rgba(${config.colorScheme.palette.base09}ff) 60deg";
        layout = "master";
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "grp:alt_shift_toggle,caps:escape";
        kb_rules = "";
        touchpad = {
          natural_scroll = false;
          disable_while_typing = true;
        };

        repeat_rate = 40;
        repeat_delay = 250;
        force_no_accel = true;
        sensitivity = 0.0; # -1.0 - 1.0, 0 means no modification.
        follow_mouse = 1;
        numlock_by_default = true;
      };

      misc = {
        enable_swallow = true;
        force_default_wallpaper = 0;
        new_window_takes_over_fullscreen = 2;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
      };

      windowrule = [
        "float,udiskie"
        "float,title:^(Transmission)$"
        "float,title:^(Volume Control)$"
        "float,title:^(Library)$"
        "size 700 450,title:^(Volume Control)$"
      ];
      windowrulev2 = [
        "float,class:^(pavucontrol)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(.protonvpn-app-wrapped)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,title:^(File Operation Progress)$"
      ];

      decoration = {
        rounding = 7;
        "col.shadow" = "rgba(1a1a1aee)";
        active_opacity = 0.85;
        inactive_opacity = 0.85;
        fullscreen_opacity = 1.0;
        blur = {
          enabled = true;
          size = 4;
          passes = 2;

          brightness = 1;
          contrast = 1.3;
          ignore_opacity = true;
          noise = 1.17e-2;

          new_optimizations = true;
          xray = true;
        };

      };

      animations = {
        enabled = true;
        first_launch_animation = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = { new_is_master = true; };

      gestures = { workspace_swipe = true; };

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
        "$mainMod,        z,   exec,   hyprlock" # Make sure you have Hyprlock installed. There's an official flake for it. See /flake.nix
        "$mainMod,        i,   exec,   ${pkgs.loupe}/bin/loupe"
        "$mainMod,        v,   exec,   ${pkgs.vlc}/bin/vlc"
        "$mainMod,        d,   exec,   ${pkgs.discord}/bin/discord"
        "$mainMod,        p,   exec,   ${scripts.rofiPowerMenuScript}/bin/script"
        ",            Print,   exec,   ${pkgs.grimblast}/bin/grimblast --notify --cursor save area ~/Pictures/Screenshots/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
        "ALT,        return,   exec,   ${pkgs.pyprland}/bin/pypr toggle term && hyprctl dispatch bringactivetotop"

        # Control media players.
        ",XF86AudioPlay,  exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ",XF86AudioPause, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ",XF86AudioNext,  exec, ${pkgs.playerctl}/bin/playerctl next"
        ",XF86AudioPrev,  exec, ${pkgs.playerctl}/bin/playerctl previous"

        # Close a window or quit Hyprland.
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT, M, exit,"

        # Toggle window states.
        "$mainMod SHIFT, t, togglefloating,"
        "$mainMod SHIFT, f, fullscreen,"

        # Move focus from one window to another.
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # Move window to either the left, right, top, or bottom.
        "$mainMod SHIFT,  h, movewindow, l"
        "$mainMod SHIFT,  l, movewindow, r"
        "$mainMod SHIFT,  k, movewindow, u"
        "$mainMod SHIFT,  j, movewindow, d"
      ]

      # WTF is this? I don't understand Nix code. 😿
        ++ map (n:
          "$mainMod SHIFT, ${toString n}, movetoworkspace, ${
            toString (if n == 0 then 10 else n)
          }") [ 1 2 3 4 5 6 7 8 9 0 ] ++ map (n:
            "$mainMod, ${toString n}, workspace, ${
              toString (if n == 0 then 10 else n)
            }") [ 1 2 3 4 5 6 7 8 9 0 ];

      binde = [
        # Move windows.
        "$mainMod SHIFT, h, moveactive, -20 0"
        "$mainMod SHIFT, l, moveactive, 20 0"
        "$mainMod SHIFT, k, moveactive, 0 -20"
        "$mainMod SHIFT, j, moveactive, 0 20"

        # Control the volume.
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute,        exec, wpctl set-mute   @DEFAULT_AUDIO_SINK@ toggle"

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
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "${pkgs.hyprpaper}/bin/hyprpaper -c ${hyprpaperConf}"
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.pyprland}/bin/pypr"

        # Please see home/gtk.nix before modifying the line below. It actually sets the cursor to Bibata-Modern-Ice.
        "hyprctl setcursor default 24"
      ];
    };
  };
}
