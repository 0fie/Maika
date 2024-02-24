# TODO: Add more mime types
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ xdg-utils ];
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/.local/desktop";
      publicShare = "${config.home.homeDirectory}/.local/public";
      templates = "${config.home.homeDirectory}/.local/templates";
    };

    mimeApps = rec {
      enable = true;
      associations.added = defaultApplications;
      defaultApplications = {
        "text/html" = [ "firefox.desktop" ];
	"application/pdf" = [ "firefox.desktop" ];
	"inode/directory" = [ "org.gnome.Nautilus.desktop" ];
      };
    };
  };
}
