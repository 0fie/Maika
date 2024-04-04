{
  config,
  pkgs,
  ...
}: let
  imageViewer = "org.gnome.Loupe.desktop";
  mediaPlayer = "mpv.desktop";
  browser = "firefox.desktop";
  docOpener = "libreoffice.desktop";
  fileManager = "org.gnome.Nautilus.desktop";
  torrentClient = "transmission-gtk.desktop";
  textEditor = "neovim.desktop";
in {
  home.packages = [pkgs.xdg-utils];
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/Projects";
      publicShare = "${config.home.homeDirectory}/.local/public";
      templates = "${config.home.homeDirectory}/.local/templates";
    };

    mimeApps = rec {
      enable = true;
      associations.added = defaultApplications;
      defaultApplications = {
        "application/pdf" = [docOpener];
        "inode/directory" = [fileManager];
        "x-scheme-handler/magnet" = torrentClient;

        # Web stuff
        "text/html" = [browser];
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "application/xhtml+xml" = browser;

        # Images
        "image/jpeg" = imageViewer;
        "image/avif" = imageViewer;
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

        # Text & Code
        "text/english" = textEditor;
        "text/plain" = textEditor;
        "application/x-shellscript" = textEditor;

        # Videos
        "video/webm" = mediaPlayer;
        "video/mp4" = mediaPlayer;
        "video/mkv" = mediaPlayer;
      };
    };
  };
}
