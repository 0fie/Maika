{ pkgs, ... }:

# Fetch the user's name and full name from home/options.nix
let inherit (import ../home/options.nix) userName userFullName;

in {
  # You can change the user name by editing home/options.nix
  users = {
    mutableUsers = true;
    users.${userName} = {
      isNormalUser = true;
      description = "${userFullName}";
      extraGroups = [ "networkmanager" "wheel" ];
      hashedPassword =
        "$y$j9T$RESLq/fRruOfj/mdwU7MQ/$Hf7riy3m/QEwAmzxU8UBvU1NASKqshloGjhXripIlg6";
      shell = pkgs.nushell;
    };
  };

  # Required by Nautilus. Does not work though.
  # If you're reading this, please help me.
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  # The line below enables crucial system components necessary for Hyprland to run properly.
  programs.hyprland.enable = true;

  # This is required by Hyprlock. The package installed through home-manager will not be able to unlock the session
  # without this configuration. Vaxry added a fallback to 'su' though.
  security.pam.services.hyprlock = { };
}
