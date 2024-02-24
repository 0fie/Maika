{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles = {
      ff = {
        isDefault = true;
        name = "ff";
        path = "ff.default";
        #userChrome = ''
	#'';
      };
    };
  };
}
