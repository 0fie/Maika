{ pkgs, ... }:

{
  programs.helix = {
    enable = true;

    extraPackages = with pkgs;
      with nodePackages; [
        vscode-langservers-extracted
        nil
        nixpkgs-fmt
        clang-tools
      ];

    languages.language = [
      {
        name = "typescript";
        indent.tab-width = 4;
        indent.unit = " ";
        auto-format = true;
      }
      {
        name = "javascript";
        indent.tab-width = 4;
        indent.unit = " ";
        auto-format = true;
      }
      {
        name = "nix";
        formatter.command = "nixpkgs-fmt";
      }
    ];

    settings = {
      keys = {
        normal = {
          C-s = ":w";
          C-q = ":bclose";
          A-l = "goto_next_buffer";
          A-h = "goto_previous_buffer";
        };
      };

      theme = "base16_transparent";

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
        cursor-shape.insert = "bar";
        whitespace.render.tab = "all";
        indent-guides = {
          render = true;
          character = "┊";
        };
      };
    };
  };
}
