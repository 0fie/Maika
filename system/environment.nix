{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      jetbrains-mono
      zip
      unzip
      wl-clipboard
      git
      neovim
      ntfs3g
    ];
  };
}
