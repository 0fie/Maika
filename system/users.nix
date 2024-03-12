{ pkgs, ... }:

let inherit (import ../home/options.nix) userName userFullName;
in {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    mutableUsers = true;
    users.${userName} = {
      isNormalUser = true;
      description = "${userFullName}";
      extraGroups = [ "networkmanager" "wheel" ];
      hashedPassword =
        "$y$j9T$RESLq/fRruOfj/mdwU7MQ/$Hf7riy3m/QEwAmzxU8UBvU1NASKqshloGjhXripIlg6";
      shell = pkgs.zsh;
    };
  };

  # Required by Nautilus. Does not work though.
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  # This is required for ZSH to function properly for this user. Removing it might prevent the user from logging in.
  programs.zsh.enable = true;

  # The line below enables crucial system components necessary for Hyprland to run properly. If you remove it, Hyprland WILL crash
  # whenever you attempt to start it.
  programs.hyprland.enable = true;

  # This is required by Hyprlock. The package installed through home-manager will not be able to unlock the session
  # without this configuration. Vaxry added a fallback to 'su' though.
  security.pam.services.hyprlock = { };
}
