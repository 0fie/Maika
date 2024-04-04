# There is nothing meaningful to edit here. See system/options.nix
# Time zone and locale are fetched from system/options.nix
let
  inherit (import ./options.nix) theTimezone theLocale;
in {
  i18n = {
    defaultLocale = "${theLocale}";
    extraLocaleSettings = {
      LC_ADDRESS = "${theLocale}";
      LC_IDENTIFICATION = "${theLocale}";
      LC_MEASUREMENT = "${theLocale}";
      LC_MONETARY = "${theLocale}";
      LC_NAME = "${theLocale}";
      LC_NUMERIC = "${theLocale}";
      LC_PAPER = "${theLocale}";
      LC_TELEPHONE = "${theLocale}";
      LC_TIME = "${theLocale}";
    };
  };

  time = {
    timeZone = "${theTimezone}";
    hardwareClockInLocalTime = true;
  };
}
