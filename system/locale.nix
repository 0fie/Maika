{ ... }:

let inherit (import ./options.nix) theTimezone theLocale theLCVariables;
in {
  i18n = {
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

  time = {
    timeZone = "${theTimezone}";
    hardwareClockInLocalTime = true;
  };
}
