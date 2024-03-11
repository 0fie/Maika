{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs;
      with nodePackages; [
        nil
        nixfmt

        omnisharp-roslyn

        typescript-language-server
        vscode-langservers-extracted
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
        formatter.command = "nixfmt";
        auto-format = true;
      }
    ];

    settings = {
      keys = {
        normal = {
          C-q = ":bclose";
          tab = "goto_next_buffer";
          S-tab = "goto_previous_buffer";
          ZZ = ":wq";
          space = {
            f = ":fmt";
            ff = "file_picker";
          };
        };
      };

      theme = "catppuccin_mocha";

      editor = {
        line-number = "relative";
        completion-trigger-len = 1;
        bufferline = "multiple";
        color-modes = true;
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
          right = [ "file-encoding" "file-type" "selections" "position" ];
        };
        cursor-shape = {
          insert = "bar";
          select = "underline";
        };
        whitespace.render.tab = "all";
        indent-guides = {
          render = true;
          character = "┊";
        };
      };
    };
  };
}
