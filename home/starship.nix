{ config, pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = lib.importTOML (pkgs.fetchFromGitHub {
      owner = "0fie";
      repo = "trash";
      rev = "main";
      sha256 = "";
    } + "/starship.toml");
  };
}
