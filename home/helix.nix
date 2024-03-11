{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs;
      with nodePackages; [
        nil
        nixfmt
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
        formatter.command = "nixfmt";
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
