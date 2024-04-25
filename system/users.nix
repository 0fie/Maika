{pkgs, ...}:
# Fetch the user's name and full name from home/options.nix
let
  inherit (import ../home/options.nix) userName userFullName;
in {
  # You can change the user name by editing home/options.nix
  users = {
    mutableUsers = true;
    users.${userName} = {
      isNormalUser = true;
      description = "${userFullName}";
      extraGroups = ["networkmanager" "wheel"];
      hashedPassword = "$y$j9T$RESLq/fRruOfj/mdwU7MQ/$Hf7riy3m/QEwAmzxU8UBvU1NASKqshloGjhXripIlg6";
      shell = pkgs.nushell;
    };
  };
}
