{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [ zip unzip wl-clipboard ntfs3g ];
  };
}
