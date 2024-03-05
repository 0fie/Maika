{ config, pkgs, inputs, ... }:

let
  names = import ../options.nix;
  userName = names.user.userName;
  userFullName = names.user.userFullName;

in {
  home.sessionVariables.BROWSER = "firefox";

  programs.firefox = {
    enable = true;
    profiles."${userName}" = {
      isDefault = true;
      name = "${userFullName}";
      path = "${userName}.default";

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        # For these plugins to start working, open the Firefox app and enable them manually.
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
