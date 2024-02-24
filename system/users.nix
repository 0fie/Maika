{ ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    mutableUsers = true;
    users.me = {
      isNormalUser = true;
      description = "Me";
      extraGroups = [ "networkmanager" "wheel" ];
      hashedPassword = "$y$j9T$RESLq/fRruOfj/mdwU7MQ/$Hf7riy3m/QEwAmzxU8UBvU1NASKqshloGjhXripIlg6";
    };
  };
}
