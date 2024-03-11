{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nil
      nixfmt
      omnisharp-roslyn
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
    ];

    languages.language = [
      {
        name = "javascript";
        indent.tab-width = 5;
        indent.unit = " ";
        auto-format = true;
      }
      {
        name = "nix";
        indent.tab-width = 2;
        indent.unit = " ";
        formatter.command = "nixfmt";
        auto-format = true;
      }
    ];

    settings = {
      theme = "catppuccin_mocha";

      keys = {
        normal = {
          C-q = ":bclose";
          tab = "goto_next_buffer";
          S-tab = "goto_previous_buffer";
          space = {
            f = ":fmt";
            b = "file_picker";
          };
          g.a = "code_action";
          Z.Z = ":wq";
        };
        insert = { j.k = "normal_mode"; };
      };

      editor = {
        line-number = "relative";
        completion-trigger-len = 1;
        bufferline = "multiple";
        color-modes = true;
        cursorline = true;
        insert-final-newline = false;
        idle-timeout = 0;

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        statusline = {
          left = [
            "mode"
            "spacer"
            "diagnostics"
            "version-control"
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
            "spinner"
          ];
          right = [ "file-type" "position-percentage" "total-line-numbers" ];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };

        cursor-shape = {
          insert = "bar";
          select = "underline";
        };

        indent-guides = {
          render = true;
          character = "┊";
        };
      };
    };
  };
}
