{ ... }:

{
  programs.direnv = {
    enable = true;
    loadInNixShell = true;
    enableNushellIntegration = true;
    nix-direnv.enable = true;
  };
}
