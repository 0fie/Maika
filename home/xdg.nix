{
  config,
  pkgs,
  ...
}: let
  browser = "firefox.desktop";
  fileManager = "org.gnome.Nautilus.desktop";
  imageViewer = "org.gnome.Loupe.desktop";
  mediaPlayer = "mpv.desktop";
  textEditor = "neovim.desktop";
in {
  xdg = {
    enable = true;
    portal = with pkgs; {
      enable = true;
      configPackages = [xdg-desktop-portal-gtk xdg-desktop-portal-hyprland xdg-desktop-portal];
      extraPortals = [xdg-desktop-portal-gtk xdg-desktop-portal];
      xdgOpenUsePortal = true;
    };
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/Projects";
      publicShare = "${config.home.homeDirectory}/.local/public";
      templates = "${config.home.homeDirectory}/.local/templates";
    };

    # TODO: use 'map' to avoid unnecessary repetition.
    mimeApps = let
      br = browser;
      fm = fileManager;
      iv = imageViewer;
      mp = mediaPlayer;
      te = textEditor;
    in rec {
      enable = true;
      associations.added = defaultApplications;
      defaultApplications = {
        # Office documents.
        "application/pdf" = br;

        "inode/directory" = fm;

        # Web stuff.
        "application/xhtml+xml" = br;
        "text/html" = br;
        "x-scheme-handler/http" = br;
        "x-scheme-handler/https" = br;

        # Images.
        "image/avif" = iv;
        "image/gif" = iv;
        "image/jpeg" = iv;
        "image/jpg" = iv;
        "image/pjpeg" = iv;
        "image/png" = iv;
        "image/tiff" = iv;
        "image/webp" = iv;
        "image/x-bmp" = iv;
        "image/x-gray" = iv;
        "image/x-icb" = iv;
        "image/x-ico" = iv;
        "image/x-png" = iv;

        # Plain text & code.
        "application/x-shellscript" = te;
        "text/plain" = te;

        # Videos.
        "video/mkv" = mp;
        "video/mp4" = mp;
        "video/webm" = mp;
      };
    };
  };
}
