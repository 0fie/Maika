{ ... }:

let inherit (import ./options.nix) theTimezone theLocale additionalLocales;
in {
  i18n = {
    defaultLocale = "${theLocale}";
    # Saves space, according to Fufexan.
    supportedLocales = additionalLocales;

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
