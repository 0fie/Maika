rec {
  # Welcome to the user's control center.
  # This file contains variables that will be used to configure the user's home environment, such as the username.
  # If you're attempting to install this entire home-manager configuration on your machine, make sure to edit this file first.
  # Also check out system/options.nix for other options such as fonts. In future, such options will be moved from system to home-manager
  # for convinience.

  ##########################################
  # Below is the username for your user. Do not include special characters.
  # Suppose you're called Tom, you'd edit the line like so:
  #
  #...
  #   userName = "tom";
  #...
  #
  # Your home directory will then be /home/tom
  # Required by home/firefox.nix (for setting up user profile) and system/users.nix (to add the user to the system)
  userName = "0fie";

  ###########################################
  # The user's full name. Can be anything.
  # Here's how Mr. Tux does it:
  #
  #...
  #   userFullName = "Mr. Tux";
  #...
  #
  # Required by home/firefox.nix (for setting up user profile)
  userFullName = "0fie";

  ##########################################
  # Your GitHub user name
  # Required by home/git.nix
  gitUserName = "0fie";

  ##########################################
  # Your git email.
  # Make sure it is correct and verified by GitHub (you should be able to login using the email)... otherwise your contributions
  # will not be recognised or displayed on your GitHub profile's 'contributions' section.
  # Required by home/git.nix
  gitEmail = "151028199+0fie@users.noreply.github.com";

  ##########################################
  # The variable below defines where these dotfiles are located on your machine. It is used by the 'hs' and 'ns' aliases in home/nushell.nix
  # Change it to the actual absolute path of these dotfiles. If they are in your Downloads folder, you'd edit the line like so:
  #
  #...
  #   dotfilesDir = "home/username/Downloads/Maika";
  #...
  #
  # Required by home/nushell.nix
  dotfilesDir = "/home/${userName}/Projects/Maika";
}
