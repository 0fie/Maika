{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    aria2
    btop
    cava
    exiftool
    file
    gnome.nautilus
    glow
    grim
    keepassxc
    lf
    networkmanagerapplet
    neofetch
    nsxiv
    slurp
    swww
    tree
    which

    powerline-symbols
  ];
}
