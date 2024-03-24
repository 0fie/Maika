# If you'd like to change the font, see system/options.nix
# There's nothing much to edit here.
{ ... }:
let inherit (import ./options.nix) fontName;
in {
  fonts = {
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
