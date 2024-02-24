{ config, ... }:

{
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_ZW.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_ZW.UTF-8";
      LC_IDENTIFICATION = "en_ZW.UTF-8";
      LC_MEASUREMENT = "en_ZW.UTF-8";
      LC_MONETARY = "en_ZW.UTF-8";
      LC_NAME = "en_ZW.UTF-8";
      LC_NUMERIC = "en_ZW.UTF-8";
      LC_PAPER = "en_ZW.UTF-8";
      LC_TELEPHONE = "en_ZW.UTF-8";
      LC_TIME = "en_ZW.UTF-8";
    };
  };

  # Configure your time settings.
  time = {
    timeZone = "Africa/Harare";
    hardwareClockInLocalTime = true;
  };
}
