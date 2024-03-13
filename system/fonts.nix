{ pkgs, ... }:

let inherit (import ./options.nix) fontPackage;
in {
  fonts = {
    packages = with pkgs;
      [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];
    enableDefaultPackages = true;
    fontconfig = {
      defaultFonts = rec {
        monospace = [ "JetBrainsMono Mono" ];
        sansSerif = [ "JetBrainsMono" ];
        serif = sansSerif;
      };
    };
  };
}
