{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    dotDir = ".config/zsh";
    history.path = "${config.home.homeDirectory}/.config/zsh/.zsh_history";

    # Aliases
    shellAliases = {
      rbs = "sudo nixos rebuild switch";
      nv = "nvim";

      # Modern yuunix, uwu <3
      # TODO: Find more modern and convinient replacements for legacy yuunix tools.
      c = "clear";
      cat = "${pkgs.bat}/bin/bat $@";
      ls =  "${pkgs.eza}/bin/eza --git --icons $@";
      # find = "${pkgs.fd}/bin/fd $@";
      # grep = "${pkgs.ripgrep}/bin/rg $@";
      # df = "${pkgs.duf}/bin/duf $@";
    };

    profileExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then;
          exec Hyprland
      fi
    '';

    plugins = [
      {
        # This allows us to use ZSH in a Nix shell. Cool!
        name = "zsh-nix-shell";
        file = "share/zsh-nix-shell/nix-shell.plugin.zsh";
        src = pkgs.zsh-nix-shell;
      }
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
      }
      {
        name = "zsh-autopair";
        file = "zsh-autopair.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopair";
          rev = "34a8bca0c18fcf3ab1561caef9790abffc1d3d49";
          sha256 = "1h0vm2dgrmb8i2pvsgis3lshc5b0ad846836m62y8h3rdb3zmpy1";
        };
      }
      {
        name = "catppuccin-zsh-syntax-hightlighting";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "zsh-syntax-highlighting";
          rev = "dbb1ec93b30dbe8cd728cffe0974aa7fa1ac3298";
          sha256 = "0B7g0J6+ZCoe1eErsSEmqO0aNOBi+FB+///vXnuiels=";
        };
        file = "themes/catppuccin_mocha-zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
        src = pkgs.zsh-syntax-highlighting;
      }
    ];
  };
  home.packages = with pkgs; [
    zsh-nix-shell
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.command-not-found.enable = true;
}
