{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    mutableUsers = true;
    users.me = {
      isNormalUser = true;
      description = "Me";
      extraGroups = [ "networkmanager" "wheel" ];
      hashedPassword = "$y$j9T$RESLq/fRruOfj/mdwU7MQ/$Hf7riy3m/QEwAmzxU8UBvU1NASKqshloGjhXripIlg6";
      shell = pkgs.zsh;
    };
  };

  # Required by Nautilus
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  # This is required for ZSH to function properly for this user. Removing it might prevent the user from logging in.
  programs.zsh.enable = true;

  # The line below enable crucial system components necessary for Hyprland to run properly. If you remove it, Hyprland WILL crash
  # whenever you attempt to start it.
  programs.hyprland.enable = true;
}
