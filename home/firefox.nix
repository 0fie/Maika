# TODO: Make Firefox use a Catppuccin theme.
{ config, pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      ff = {
        isDefault = true;
        name = "ff";
        path = "ff.default";
        userChrome =  builtins.readFile (pkgs.fetchFromGitHub {
          owner = "0fie";
          repo = "trash";
          rev = "main";
          sha256 = "sha256-USUb1b5LOo2n2kMzWgV/o6Xu+t9cnmH7+z/ci3vsrd0=";
        } + "/userChrome.css");
      };
    };
  };
}
