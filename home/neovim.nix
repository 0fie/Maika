{ inputs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = false;
    withRuby = false;
  };

  xdg.configFile = { "nvim".source = "${inputs.my-neovim}"; };
}
