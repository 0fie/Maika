{ config, pkgs, ... }:

let
  browser = "firefox.desktop";
  docOpener = "zathura.desktop";
  imageViewer = "org.gnome.Loupe.desktop";
  fileManager = "org.gnome.Nautilus.desktop";
  torrentClient = "transmission-gtk.desktop";
in
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
	"application/pdf" = [ docOpener ];
	"inode/directory" = [ fileManager ];
	"x-scheme-handler/magnet" = torrentClient;

	# Web stuff
	"text/html" = [ browser ];
	"x-scheme-handler/http" = browser;
	"x-scheme-handler/https" = browser;
	"application/xhtml+xml" = browser;

        # Images
        "image/jpeg" = imageViewer;
        "image/bmp" = imageViewer;
        "image/gif" = imageViewer;
        "image/jpg" = imageViewer;
        "image/pjpeg" = imageViewer;
        "image/png" = imageViewer;
        "image/tiff" = imageViewer;
        "image/webp" = imageViewer;
        "image/x-bmp" = imageViewer;
        "image/x-gray" = imageViewer;
        "image/x-icb" = imageViewer;
        "image/x-ico" = imageViewer;
        "image/x-png" = imageViewer;
        "image/x-portable-anymap" = imageViewer;
        "image/x-portable-bitmap" = imageViewer;
        "image/x-portable-graymap" = imageViewer;
        "image/x-portable-pixmap" = imageViewer;
        "image/x-xbitmap" = imageViewer;
        "image/x-xpixmap" = imageViewer;
        "image/x-pcx" = imageViewer;
        "image/svg+xml" = imageViewer;
        "image/svg+xml-compressed" = imageViewer;
        "image/vnd.wap.wbmp" = imageViewer;
        "image/x-icns" = imageViewer;
      };
    };
  };

  xdg.desktopEntries = {
    nvim = {
      name = "Neovim";
      genericName = "Text Editor";
      comment = "Edit text files";
      exec = "nvim %F";
      icon = "nvim";
      mimeType = [
        "text/english"
        "text/plain"
        "text/x-makefile"
        "text/x-c++hdr"
        "text/x-c++src"
        "text/x-chdr"
        "text/x-csrc"
        "text/x-java"
        "text/x-moc"
        "text/x-pascal"
        "text/x-tcl"
        "text/x-tex"
        "application/x-shellscript"
        "text/x-c"
        "text/x-c++"
      ];
      terminal = true;
      type = "Application";
      categories = [ "Utility" "TextEditor" ];
    };
  };
}
