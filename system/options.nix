{
  # This file defines a bunch of options to be used on the NixOS system, such as the default fonts, time zone, etc.

  ####################################################
  # You may wish to change the system's hostname. This can be achieved by editing the line below. Suppose you want to set
  # the hostname to 'Hyprnix', you'd edit the line like so:
  # ...
  #    hostName = "Hyprnix";
  # ...
  #
  # Your hostname will be visible to other gadgets on the network, just so you know.
  # Required by system/networking.nix
  hostName = "NixOS";

  ####################################################
  # The variable below defines the locale to be used on the computer. It is used by apps to determine language settings,
  # sort orders, character sets, etc. Suppose you're based in the Netherlands, you'd change the locale like so:
  # ...
  #    theLocale = "nl_NL.UTF-8";
  # ...
  #
  # If you don't set the correct locale, programs might display text in other languages.
  # Required by system/locale.nix
  theLocale = "en_US.UTF-8";

  ####################################################
  # The variable below defines additional locale and internationalisation properties for your computer. It defines date and time
  # formats as well as currency formats. Suppose you're based in Germany, you'd edit the line below like so:
  #
  # ...
  #    theLCVariable = "de_DE.UTF-8";
  # ...
  #
  # If you set the wrong internationalisation property, apps like the browser will display dates and currency in "incorrect" formats.
  # Required by system/locale.nix
  theLCVariables = "en_ZW.UTF-8";

  ####################################################
  # You almost certainly want to edit the line below. It defines the time zone used when displaying times and dates. Suppose
  # you're based in New York, USA, you'd edit the line below like so:
  #
  # ...
  #    theTimezone = "America/New_York";
  # ...
  #
  # See https://en.wikipedia.org/wiki/List_of_tz_database_time_zones for a list of possible values.
  # Required by system/locale.nix
  theTimezone = "Africa/Harare";

  ####################################################
  # The variable below is used by the flake to determine the system architecture. By default, it's for 64-bit Intel/AMD Linux.
  # Suppose you're on 64-bit Intel macOS, you'd edit the line below like so:
  #
  #...
  #   system = "x86_64-darwin";
  #...
  #
  # However, I can not guarantee that the rest of this NixOS configuration will function properly in that case. It will not.
  # Required by flake.nix
  system = "X86_64-linux";

  ####################################################
  # The 'fontName' variable below is used by apps like Waybar and Kitty to determine which font to use. It is *not* the actual font
  # package that will get installed. The actual font package to be installed is defined in the fontPackage variable, and it
  # is the JetBrainsMono nerd font. Suppose you want to switch to the Iosevka nerd font, you'd edit the line below like so:
  # ...
  #    fontName = "Iosevka Nerd Font";
  # ...
  #
  # And then change fontPackage to the actual Iosevka nerd font like so:
  # ...
  #    fontPackage = "Iosevka";
  # ...
  # Don't add 'Mono' in front of the fontName... otherwise icons will appear 'too small' in Kitty.
  # Required by system/fonts.nix
  fontName = "JetBrainsMono Nerd Font";
  fontPackage = "JetBrainsMono";
}
