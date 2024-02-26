{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      zip
      unzip
      wl-clipboard
      git
      neovim
      ntfs3g
      udiskie
    ];

    variables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      NIXOS_OZONE_WL = "1";
      ELECTRON_USE_WAYLAND = "1";
    };
  };
}
