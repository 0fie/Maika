let
  username = "me";
  hostname = "nixos";
  userHome = "/home/${username}";
  flakeDir = "${userHome}/zaneyos";
in 
{
  # User Variables
  username = "${username}";
  hostname = "${hostname}";

  gitUsername = "Tyler Kelley";
  gitEmail = "tylerzanekelley@gmail.com";

  theme = "catppuccin-mocha";
  browser = "firefox";
  screenshotDir = "${userHome}/Pictures/Screenshots";

  theKBDLayout = "us";
  theLocale = "en_US.UTF-8";
  theLCVariables = "en_US.UTF-8";
  theTimezone = "America/Chicago";

  flakeDir = "${flakeDir}";
  flakePrev = "${userHome}/.zaneyos-previous";
  terminal = "kitty"; # This sets the terminal that is used by the hyprland terminal keybinding

  # System Settings
  clock24h = false;
  theShell = "zsh"; # Possible options: bash, zsh
  theKernel = "default"; # Possible options: default, latest, lqx, xanmod, zen
  cpuType = "intel";
  kitty = true;
}
