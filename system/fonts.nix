{ pkgs, ... }:

let inherit (import ./options.nix) fontName fontPackage;
in {
  fonts = {
    packages = with pkgs;
    # Add your preferred nerd font below, and then edit system/options.nix to set it as the default font. Under normal
    # circumstances, it's the only line you should edit in this file.
      [ (nerdfonts.override { fonts = [ "${fontPackage}" ]; }) ];
    enableDefaultPackages = true;
    fontconfig = {
      defaultFonts = rec {
        monospace = [ "${fontName} Mono" ];
        sansSerif = [ "${fontName}" ];
        serif = sansSerif;
      };
    };
  };
}
