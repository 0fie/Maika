{ config, pkgs, lib, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.me = {
      isDefault = true;
      name = "me";
      path = "me.default";
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        sponsorblock
        vimium
      ];

      settings = {
        "browser.download.panel.shown" = true;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "dom.security.https_only_mode" = true;
        "privacy.trackingprotection.enabled" = true;
        "signon.rememberSignons" = true;
      };
    };
  };
}
