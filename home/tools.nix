{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    aria2
    btop
    cava
    emote # Emoji picker
    exiftool
    file
    gnome.nautilus
    gnome-photos # TODO: Configure mime types - images should open using this tool.
    glow
    keepassxc
    lf
    neofetch
    powerline-symbols
    which
  ];
}
