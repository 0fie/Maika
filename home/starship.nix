{ config, pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = lib.importTOML (pkgs.fetchFromGitHub {
      owner = "0fie";
      repo = "trash";
      rev = "main";
      sha256 = "sha256-tGZ85IqQ+K5DzF7nk7F2YhBn/NPKYc3EjPu0jA0fExg=";
    } + "/starship.toml");
  };
}
