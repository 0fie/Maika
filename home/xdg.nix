{ config, pkgs, ... }:

let
  imageViewer = "org.gnome.Loupe.desktop";
  mediaPlayer = "vlc.desktop";
  browser = "firefox.desktop";
  docOpener = "zathura.desktop";
  fileManager = "org.gnome.Nautilus.desktop";
  torrentClient = "transmission-gtk.desktop";
  textEditor = "neovim.desktop";
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
        "image/avif" = imageViewer;
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

        # Text & Code
        "text/english" = textEditor;
        "text/plain" = textEditor;
        "text/x-makefile" = textEditor;
        "text/x-c++hdr" = textEditor;
        "text/x-c++src" = textEditor;
        "text/x-chdr" = textEditor;
        "text/x-csrc" = textEditor;
        "text/x-java" = textEditor;
        "text/x-moc" = textEditor;
        "text/x-pascal" = textEditor;
        "text/x-tcl" = textEditor;
        "text/x-tex" = textEditor;
        "application/x-shellscript" = textEditor;
        "text/x-c" = textEditor;
        "text/x-c++" = textEditor;

        # Videos
	"video/webm" = mediaPlayer;
	"video/ogg" =  mediaPlayer;
	"video/mp4" = mediaPlayer;
	"video/avi" = mediaPlayer;
	"video/mkv" = mediaPlayer;
      };
    };
  };
}
