{ config, pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = lib.importTOML (pkgs.fetchFromGitHub {
      owner = "0fie";
      repo = "trash";
      rev = "main";
      sha256 = "sha256-wIDHFaeEiabfuRuuwJpT25sgfBdM0yYk2oZDh1KlFI8=";
    } + "/starship.toml");
  };
}
