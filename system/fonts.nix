{ pkgs, ... }:

let inherit (import ./options.nix) fontName;
in {
  fonts = {
    packages = with pkgs;
      [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];
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
