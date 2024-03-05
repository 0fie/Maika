{ config, pkgs, inputs, ... }:

let inherit (import ../options/home/home.nix) userName;

in {
  home.sessionVariables.BROWSER = "firefox";

  programs.firefox = {
    enable = true;
    profiles."${userName}" = {
      isDefault = true;
      name = "${userName}";
      path = "${userName}.default";
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        sponsorblock
        vimium
      ];

      settings = {
        "browser.download.panel.shown" = true;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.tabs.loadInBackground" = true;
        "extensions.pocket.enabled" = false;
        "dom.security.https_only_mode" = true;
        "privacy.trackingprotection.enabled" = true;
        "signon.rememberSignons" = true;
      };

      bookmarks = [
        {
          name = "Nix sites";
          toolbar = false;
          bookmarks = [
            {
              name = "homepage";
              url = "https://nixos.org/";
            }
            {
              name = "wiki";
              url = "https://nixos.wiki/";
            }
            {
              name = "nix.dev";
              url = "https://nix.dev/";
            }
            {
              name = "discourse";
              url = "https://discourse.nixos.org";
            }
            {
              name = "discord";
              url = "https://nixos.org";
            }
          ];
        }

        {
          name = "Neocities";
          toolbar = false;
          bookmarks = [{
            name = "Cyuucat";
            url = "https://cyuucat.moe";
          }];
        }

        {
          name = "Other";
          toolbar = false;
          bookmarks = [
            {
              name = "Xe";
              url = "https://xeiaso.net";
            }
            {
              name = "FT-Lime";
              url = "https://fasterthanli.me";
            }
          ];
        }
      ];
    };
  };
}
