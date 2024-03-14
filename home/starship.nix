{ lib, inputs, ... }:

{
  programs.starship = {
    enable = true;
    settings =
      lib.importTOML (builtins.readFile "${inputs.trash}/starship.toml");
  };
}
