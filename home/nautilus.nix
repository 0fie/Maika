{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ gnome.nautilus ];
}
