{ lib, inputs, ... }:

{
  programs.starship = {
    enable = true;
    settings = lib.importTOML "${inputs.trash}/starship.toml";
  };
}
