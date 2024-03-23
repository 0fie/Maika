# TODO: Remove unnecessary gst-plugins
{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [ gnome.nautilus gst_all_1.gstreamer ];

    # These session variables allow Nautilus to display audio/video properties of a media file.
    # For some reason it stopped working. Please help me if you're reading this.
    sessionVariables = {
      GST_PLUGIN_SYSTEM_PATH_1_0 =
        lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0" [
          pkgs.gst_all_1.gst-plugins-good
          pkgs.gst_all_1.gst-plugins-bad
          pkgs.gst_all_1.gst-plugins-ugly
        ];
    };
  };

  # Automatically mounts new devices/peripherals.
  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "never";
  };

  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };
  };

  # Refer to system/services.nix. The first 3 services in that file give additional functionality to Nautilus.
}
