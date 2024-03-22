{ lib, inputs, ... }:

{
  programs.neovim = {
    enable = true;
    #defaultEditor = lib.mkDefault 100;
    viAlias = true;
    vimAlias = true;
    withPython3 = false;
    withRuby = false;
  };

  xdg.configFile = { "nvim".source = "${inputs.my-neovim}"; };
}
