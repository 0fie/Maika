{ pkgs, lib, ... }:

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

    variables = { EDITOR = "nvim"; };
  };
}
