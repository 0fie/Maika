{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    aria2
    btop
    cava
    emote # Emoji picker - move this to ../home/hyprland.nix
    exiftool
    file
    # github-desktop
    gnome.nautilus
    glow
    keepassxc
    lf
    neofetch
    powerline-symbols
    which
  ];
}
