{
  # User options.

  ##########################################
  # Below is the username for your user. Do not include special characters or capital letters.
  # Suppose you're called Tom, you'd edit the line like so:
  #
  #...
  #   userName = "tom";
  #...
  #
  # Your home directory will then be /home/tom
  # Required by home/firefox.nix (for setting up user profile) and system/users.nix (to add the user to the system)
  userName = "me";

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
  # Your real GitHub user name
  # Required by home/git.nix
  gitUserName = "0fie";

  ##########################################
  # Your git email.
  # Make sure it is correct and verified by GitHub... otherwise your contributions will not be recognised or displayed
  # on your GitHub profile's 'contributions' section.
  # Required by home/git.nix
  gitEmail = "151028199+0fie@users.noreply.github.com";

  ##########################################
  # The variable below defines where these dotfiles are located on your machine. It is used by the 'nrs' alias in home/nushell.nix
  # Change it to the actual absolute path of these dotfiles. If they are in your Downloads folder, you'd edit the line like so:
  #
  #...
  #   dotfilesDir = "home/username/Downloads/Dotfiles";
  #...
  #
  # This is not a critical or necessary option. It is only used for the 'nixos-rebuild switch' alias for convinience.
  # Required by home/nushell.nix
  dotfilesDir = "/home/me/Projects/Dotfiles";
}
