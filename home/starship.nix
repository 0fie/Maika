{ pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = lib.importTOML (pkgs.fetchFromGitHub {
      owner = "0fie";
      repo = "trash";
      rev = "main";
      sha256 = "sha256-EaGdDJgpiVG6ICaACdV+MEtf4mC4cfu0xbWrLlKzyWY=";
    } + "/starship.toml");
  };
}
