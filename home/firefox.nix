{ config, pkgs, inputs, ... }:

let inherit (import ./options.nix) userName gitUserName hostName;

in {
  home.sessionVariables.BROWSER = "firefox";

  programs.firefox = {
    enable = true;
    profiles."${userName}" = {
      isDefault = true;
      name = "${gitUserName}";
      path = "${userName}.default";

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        sponsorblock
      ];

      settings = {
        # Don't disable extensions dropped in to a system
        # location, or those owned by the application
        "extensions.autoDisableScopes" = 3;

        # Don't call home for blacklisting
        "extensions.blocklist.enabled" = false;

        # Prevent EULA dialog to popup on first run
        "browser.EULA.override" = true;

        # Extensions cannot be updated without permission
        "extensions.update.enabled" = false;

        # Release notes and vendor URLs
        "app.releaseNotesURL" = "http://127.0.0.1/";
        "app.vendorURL" = "http://127.0.0.1/";
        "app.privacyURL" = "http://127.0.0.1/";

        # Disable plugin installer
        "plugins.hide_infobar_for_missing_plugin" = true;
        "plugins.hide_infobar_for_outdated_plugin" = true;
        "plugins.notifyMissingFlash" = false;

        # Speeding it up
        "network.http.pipelining" = true;
        "network.http.proxy.pipelining" = true;
        "network.http.pipelining.maxrequests" = 10;
        "nglayout.initialpaint.delay" = 0;
        "nglayout.initialpaint.delay_in_oopif" = 0;
        "browser.startup.preXulSkeletonUI" = false;
        "content.notify.interval" = 100000;

        "browser.download.panel.shown" = true;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.tabs.loadInBackground" = true;
        "dom.security.https_only_mode" = true;
        "privacy.trackingprotection.enabled" = true;
        "signon.rememberSignons" = true;
        "browser.toolbars.bookmarks.visibility" = "never";

        # Disable homecalling
        "app.update.url" = "http://127.0.0.1/";
        "startup.homepage_welcome_url" = "";
        "browser.startup.homepage_override.mstone" = "ignore";
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.healthreport.about.reportUrl" = "http://127.0.0.1/";
        "datareporting.healthreport.service.enabled" = false;
        "datareporting.healthreport.documentServerURI" = "http://127.0.0.1/";
        "healthreport.uploadEnabled" = false;
        "social.toast-notifications.enabled" = false;

        "browser.tabs.crashReporting.sendReport" = false;
        "breakpad.reportURL" = "";

        # Make sure updater telemetry is disabled; see <https://trac.torproject.org/25909>.
        "toolkit.telemetry.updatePing.enabled" = false;

        # Do not tell what plugins we have enabled: https://mail.mozilla.org/pipermail/firefox-dev/2013-November/001186.html
        "plugins.enumerable_names" = "";
        "plugin.state.flash" = 0;
        "browser.search.update" = false;

        # Disable sensors
        "dom.battery.enabled" = false;
        "device.sensors.enabled" = false;
        "camera.control.face_detection.enabled" = false;
        "camera.control.autofocus_moving_callback.enabled" = false;
        "network.http.speculative-parallel-limit" = 0;
        "browser.urlbar.speculativeConnect.enabled" = false;

        # Don't download ads for the newtab page
        "browser.newtabpage.directory.source" = "";
        "browser.newtabpage.directory.ping" = "";
        "browser.newtabpage.introShown" = true;

        # Disable geolocation
        "geo.enabled" = false;
        "geo.wifi.uri" = "";
        "browser.search.geoip.url" = "";
        "browser.search.geoSpecificDefaults" = false;
        "browser.search.geoSpecificDefaults.url" = "";
        "browser.search.modernConfig" = false;

        # Don't report TLS errors to Mozilla
        "security.ssl.errorReporting.enabled" = false;

        # Disable Pocket integration
        "browser.pocket.enabled" = false;
        "extensions.pocket.enabled" = false;

        # Disable More from Mozilla
        "browser.preferences.moreFromMozilla" = false;

        # Do not show unicode urls https://www.xudongz.com/blog/2017/idn-phishing/
        "network.IDN_show_punycode" = true;

        # Disable screenshots extension
        "extensions.screenshots.disabled" = true;

        # Disable onboarding
        "browser.onboarding.newtour" =
          "performance,private,addons,customize,default";
        "browser.onboarding.updatetour" =
          "performance,library,singlesearch,customize";
        "browser.onboarding.enabled" = false;

        # Disable recommended extensions
        "extensions.htmlaboutaddons.discover.enabled" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;

        # Disable use of WiFi region/location information
        "browser.region.network.scan" = false;
        "browser.region.network.url" = "";
        "browser.region.update.enabled" = false;

        # Disable VPN/mobile promos
        "browser.contentblocking.report.hide_vpn_banner" = true;
        "browser.contentblocking.report.mobile-ios.url" = "";
        "browser.contentblocking.report.mobile-android.url" = "";
        "browser.contentblocking.report.show_mobile_app" = false;
        "browser.contentblocking.report.vpn.enabled" = false;
        "browser.contentblocking.report.vpn.url" = "";
        "browser.contentblocking.report.vpn-promo.url" = "";
        "browser.contentblocking.report.vpn-android.url" = "";
        "browser.contentblocking.report.vpn-ios.url" = "";
        "browser.privatebrowsing.promoEnabled" = false;
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
