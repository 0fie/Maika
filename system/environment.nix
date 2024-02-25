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
      polkit-gnome
    ];

    variables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      NIXOS_OZONE_WL = "1";
    };
  };
}
