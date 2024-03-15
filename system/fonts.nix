# If you'd like to change the font, see system/options.nix
# There's nothing much to edit here, besides uncommenting those 2 lines
{ pkgs, ... }:

let inherit (import ./options.nix) fontName fontPackage;
in {
  fonts = {
    #packages = with pkgs;
    #  [ (nerdfonts.override { fonts = [ "${fontPackage}" ]; }) ];
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
