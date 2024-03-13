{ pkgs, ... }:

{
  environment = {
    # Packages to be installed into the system profile. Every user including root will have these packages.
    systemPackages = with pkgs; [ zip unzip wl-clipboard ntfs3g ];
  };
}
