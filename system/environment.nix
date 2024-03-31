{ pkgs, ... }:

{
  environment = {
    # Packages to be installed into the system profile. Every user including root will have these packages.
    # ntfs3g allows us to mount external drives that use NTFS.
    systemPackages = with pkgs; [ zip unzip wl-clipboard ntfs3g ];
  };
}
