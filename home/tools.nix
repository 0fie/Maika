{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    aria2
    btop
    cava
    deepin.dde-polkit-agent
    emote # Emoji picker
    exiftool
    file
    # github-desktop
    gnome.nautilus
    glow
    keepassxc
    lf
    neofetch
    polkit-gnome
    powerline-symbols
    which
  ];
}
