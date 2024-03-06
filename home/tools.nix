{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    aria2
    exiftool
    file
    git-extras
    gst_all_1.gstreamer
    keepassxc
    lf
    loupe
    mono
    nixfmt
    nodejs_21
    nodePackages.prettier
    protonvpn-gui
    vlc
    which
    yarn
  ];
}
