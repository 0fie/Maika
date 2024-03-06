{ config, ... }:

let inherit (import ./options.nix) theTimezone theLocale theLCVariables;
in {
  # Select internationalisation properties.
  i18n = {
    # Set your time zone
    time.timeZone = "${theTimezone}";

    # Select internationalisation properties
    i18n.defaultLocale = "${theLocale}";
    i18n.extraLocaleSettings = {
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
    timeZone = "${theTimezone}/Harare";
    hardwareClockInLocalTime = true;
  };
}
