{ ... }:

let inherit (import ./options.nix) theTimezone theLocale theLCVariables;
in {
  # Select internationalisation properties.
  i18n = {

    # Select internationalisation properties
    defaultLocale = "${theLocale}";
    extraLocaleSettings = {
      LC_ADDRESS = "${theLCVariables}";
      LC_IDENTIFICATION = "${theLCVariables}";
      LC_MEASUREMENT = "${theLCVariables}";
      LC_MONETARY = "${theLCVariables}";
      LC_NAME = "${theLCVariables}";
      LC_NUMERIC = "${theLCVariables}";
      LC_PAPER = "${theLCVariables}";
      LC_TELEPHONE = "${theLCVariables}";
      LC_TIME = "${theLCVariables}";
    };
  };

  # Configure your time settings.
  time = {
    timeZone = "${theTimezone}";
    hardwareClockInLocalTime = true;
  };
}
