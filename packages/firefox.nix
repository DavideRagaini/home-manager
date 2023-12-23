{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    policies = {
      DefaultDownloadDirectory = "\${home}/Downloads";
      CaptivePortal = false;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFirefoxAccounts = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      FirefoxHome = {
        Search = true;
        Pocket = false;
        Snippets = false;
        TopSites = false;
        Highlights = false;
      };
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
      };
    };
    package = pkgs.firefox;
    # package = pkgs.firefox.override {
    #   cfg = {enableTridactylNative = true;};
    # };
    profiles = {
      nixhm = {
        id = 0;
        name = "nixhm";
        search = {
          force = true;
          privateDefault = "SearX";
          default = "SearX";
          # order = [  ];
          engines = {
            "SearX" = {
              urls = [{
                template = "https://searx.be/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                  {
                    name = "category_general";
                    value = "on";
                  }
                  {
                    name = "time_range";
                    value = "";
                  }
                  {
                    name = "language";
                    value = "en";
                  }
                ];
              }];
              # icon =
              # "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "sx" ];
            };
            "Yewtube" = {
              urls = [{
                template = "https://yewtu.be/search";
                params = [{
                  name = "q";
                  value = "{searchTerms}";
                }];
              }];
              # icon =
              # "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              # definedAliases = [ "" ];
            };
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }];
              icon =
                "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "np" ];
            };
            "NixOS Options" = {
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }];
              icon =
                "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "no" ];
            };
            "NixOS Wiki" = {
              urls = [{
                template = "https://nixos.wiki/index.php?search={searchTerms}";
              }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              # updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "nw" ];
            };
            "Home Manager Options" = {
              urls = [{
                template =
                  "https://mipmip.github.io/home-manager-option-search/";
                params = [{
                  name = "query";
                  value = "{searchTerms}";
                }];
              }];
              definedAliases = [ "ho" ];
            };
            "Wikipedia (en)".metaData.alias = "w";
            "Google".metaData.hidden = true;
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;
            "eBay".metaData.hidden = true;
          };
        };
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          darkreader
          keepassxc-browser
          # tridactyl
          ublock-origin
          vimium
          # violentmonkey
        ];
        containers = {
          "linux" = {
            name = "linux";
            id = 1;
            color = "yellow";
            icon = "fruit";
          };
          "shopping" = {
            name = "shopping";
            id = 2;
            color = "orange";
            icon = "cart";
          };
          "nixos" = {
            name = "nixos";
            id = 3;
            color = "blue";
            icon = "chill";
          };
          "work" = {
            name = "work";
            id = 4;
            color = "red";
            icon = "briefcase";
          };
          "programming" = {
            name = "programming";
            id = 5;
            color = "green";
            icon = "tree";
          };
          "personal" = {
            name = "personal";
            id = 6;
            color = "pink";
            icon = "fingerprint";
          };
        };
        settings = {
          "accessibility.typeaheadfind.flashBar" = 0;
          "app.normandy.api_url" = "";
          "app.normandy.enabled" = false;
          "app.normandy.first_run" = false;
          "app.normandy.migrationsApplied" = 12;
          "app.shield.optoutstudies.enabled" = false;
          "app.update.auto" = false;
          "beacon.enabled" = false;
          "breakpad.reportURL" = "";
          "browser.aboutConfig.showWarning" = false;
          "browser.bookmarks.addedImportButton" = true;
          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.cache.disk.enable" = false;
          "browser.contentblocking.category" = "strict";
          "browser.discovery.enabled" = false;
          "browser.display.background_color" = "#c5c8c6";
          "browser.display.foreground_color" = "#1d1f21";
          "browser.display.use_system_colors" = false;
          "browser.download.panel.shown" = true;
          "browser.download.viewableInternally.typeWasRegistered.webp" = true;
          "browser.firefox-view.view-count" = 4;
          "browser.fixup.alternate.enabled" = false;
          "browser.formfill.enable" = false;
          "browser.helperApps.deleteTempFileOnExit" = true;
          "browser.laterrun.enabled" = true;
          "browser.newtab.preload" = false;
          "browser.newtabpage.activity-stream.default.sites" = "";
          "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" =
            false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.feeds.snippets" = false;
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" =
            "";
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" =
            "";
          "browser.newtabpage.activity-stream.section.highlights.includePocket" =
            false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.newtabpage.activity-stream.topSitesRows" = 4;
          "browser.newtabpage.enabled" = true;
          "browser.newtabpage.storageVersion" = 1;
          "browser.pagethumbnails.capturing_disabled" = true;
          "browser.pagethumbnails.storage_version" = 3;
          "browser.ping-centre.telemetry" = false;
          "browser.places.speculativeConnect.enabled" = false;
          "browser.policies.applied" = true;
          "browser.proton.toolbar.version" = 3;
          "browser.region.network.url" = "";
          "browser.region.update.enabled" = false;
          "browser.safebrowsing.allowOverride" = false;
          "browser.safebrowsing.appRepURL" = "";
          "browser.safebrowsing.blockedURIs.enabled" = false;
          "browser.safebrowsing.downloads.enabled" = false;
          "browser.safebrowsing.downloads.remote.block_potentially_unwanted" =
            false;
          "browser.safebrowsing.downloads.remote.block_uncommon" = false;
          "browser.safebrowsing.downloads.remote.enabled" = false;
          "browser.safebrowsing.downloads.remote.url" = "";
          "browser.safebrowsing.malware.enabled" = false;
          "browser.safebrowsing.phishing.enabled" = false;
          "browser.safebrowsing.provider.google.gethashURL" = "";
          "browser.safebrowsing.provider.google.updateURL" = "";
          "browser.safebrowsing.provider.google4.dataSharingURL" = "";
          "browser.safebrowsing.provider.google4.gethashURL" = "";
          "browser.safebrowsing.provider.google4.updateURL" = "";
          "browser.search.region" = "US";
          "browser.search.hiddenOneOffs" =
            "Google,Yahoo,Bing,Amazon.com,Twitter";
          "browser.search.suggest.enabled" = false;
          "browser.search.suggest.enabled.private" = true;
          "browser.send_pings" = false;
          "browser.sessionstore.privacy_level" = 2;
          "browser.sessionstore.resume_from_crash" = false;
          "browser.shell.didSkipDefaultBrowserCheckOnFirstRun" = true;
          "browser.shell.shortcutFavicons" = false;
          "browser.startup.blankWindow" = false;
          "browser.startup.homepage" =
            "file:///home/davide/sources/startpage/index.html";
          "browser.search.isUS" = true;
          "distribution.searchplugins.defaultLocale" = "en-US";
          "general.useragent.locale" = "en-US";
          "browser.bookmarks.showMobileBookmarks" = true;
          "browser.newtabpage.pinned" = [
            {
              title = "YewTube";
              url = "https://yewtu.be";
            }
            {
              title = "NixOS";
              url = "https://nixos.org";
            }
            {
              title = "Doom Emacs";
              url = "https://github.com/doomemacs/doomemacs";
            }
          ];
          "browser.startup.page" = 1;
          "browser.tabs.closeWindowWithLastTab" = false;
          "browser.tabs.crashReporting.sendReport" = false;
          "browser.tabs.tabmanager.enabled" = false;
          "browser.tabs.warnOnClose" = false;
          "browser.theme.content-theme" = 0;
          "browser.theme.toolbar-theme" = 0;
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.uiCustomization.state" = ''
            {"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":[],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","urlbar-container","save-to-pocket-button","downloads-button","fxa-toolbar-menu-button","unified-extensions-button","ublock0_raymondhill_net-browser-action","addon_darkreader_org-browser-action","keepassxc-browser_keepassxc_org-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button","firefox-view-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["developer-button","ublock0_raymondhill_net-browser-action","addon_darkreader_org-browser-action","keepassxc-browser_keepassxc_org-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","unified-extensions-area","TabsToolbar","toolbar-menubar"],"currentVersion":20,"newElementCount":5}'';
          "browser.urlbar.quicksuggest.enabled" = false;
          "browser.urlbar.quicksuggest.migrationVersion" = 2;
          "browser.urlbar.quicksuggest.scenario" = "history";
          "browser.urlbar.speculativeConnect.enabled" = false;
          "browser.urlbar.suggest.quickactions" = false;
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;
          "browser.urlbar.suggest.searches" = false;
          "browser.urlbar.suggest.topsites" = false;
          "browser.urlbar.trimURLs" = false;
          "browser.xul.error_pages.expert_bad_cert" = true;
          "captivedetect.canonicalURL" = "";
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "distribution.nixos.bookmarksProcessed" = true;
          "doh-rollout.disable-heuristics" = true;
          "doh-rollout.doneFirstRun" = true;
          "dom.disable_open_during_load" = true;
          "dom.event.clipboardevents.enabled" = false;
          "dom.forms.autocomplete.formautofill" = true;
          "dom.popup_allowed_events" = "click dblclick mousedown pointerdown";
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_ever_enabled" = true;
          "dom.security.https_only_mode_send_http_background_request" = false;
          "experiments.activeExperiment" = false;
          "experiments.enabled" = false;
          "experiments.supported" = false;
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
          "extensions.Screenshots.disabled" = false;
          "extensions.enabledScopes" = 5;
          "extensions.formautofill.addresses.enabled" = false;
          "extensions.formautofill.available" = "off";
          "extensions.formautofill.creditCards.available" = false;
          "extensions.formautofill.creditCards.enabled" = false;
          "extensions.formautofill.heuristics.enabled" = false;
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "extensions.pictureinpicture.enable_picture_in_picture_overrides" =
            true;
          "extensions.pocket.enabled" = false;
          "extensions.systemAddonSet" = ''{"schema":1,"addons":{}}'';
          "extensions.ui.dictionary.hidden" = true;
          "extensions.ui.extension.hidden" = false;
          "extensions.ui.lastCategory" = "addons://list/extension";
          "extensions.ui.locale.hidden" = true;
          "extensions.ui.sitepermission.hidden" = true;
          "extensions.webcompat.enable_shims" = true;
          "extensions.webcompat.perform_injections" = true;
          "extensions.webcompat.perform_ua_overrides" = true;
          "extensions.webextensions.ExtensionStorageIDB.migrated.addon@darkreader.org" =
            true;
          "extensions.webextensions.ExtensionStorageIDB.migrated.keepassxc-browser@keepassxc.org" =
            true;
          "extensions.webextensions.ExtensionStorageIDB.migrated.screenshots@mozilla.org" =
            true;
          "extensions.webextensions.ExtensionStorageIDB.migrated.tridactyl.vim.betas@cmcaine.co.uk" =
            true;
          "extensions.webextensions.ExtensionStorageIDB.migrated.uBlock0@raymondhill.net" =
            true;
          "extensions.webextensions.restrictedDomains" = "";
          "fission.autostart" = true;
          "font.size.variable.x-western" = 12;
          "full-screen-api.ignore-widgets" = false;
          "gecko.handlerService.defaultHandlersVersion" = 1;
          "general.autoScroll" = true;
          "general.smoothScroll" = false;
          "general.useragent.override" =
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36";
          "geo.enabled" = false;
          "geo.provider.network.url" =
            "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
          "geo.provider.use_geoclue" = false;
          "geo.provider.use_gpsd" = false;
          # "gfx.webrender.all" = true;
          # "gfx.webrender.enabled" = true;
          "intl.accept_languages" = "en-US, en";
          "javascript.use_us_english_locale" = true;
          "layout.css.devPixelsPerPx" = 1;
          "media.autoplay.default" = 5;
          "media.eme.enabled" = false;
          # "media.ffmpeg.vaapi.enabled" = true;
          # "media.ffvpx.enabled" = false;
          "media.gmp.storage.version.observed" = 1;
          "media.navigator.enabled" = false;
          "media.peerconnection.enabled" = false;
          "media.peerconnection.ice.default_address_only" = true;
          "media.peerconnection.ice.no_host" = true;
          "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
          "media.rdd-vpx.enabled" = true;
          "media.video_stats.enabled" = false;
          "media.videocontrols.picture-in-picture.allow-multiple" = false;
          "messaging-system-action.showEmbeddedImport" = true;
          "network.IDN_show_punycode" = true;
          "network.allow-experiments" = false;
          "network.auth.subresource-http-auth-allow" = 1;
          "network.captive-portal-service.enabled" = false;
          "network.connectivity-service.enabled" = false;
          "network.cookie.lifetimePolicy" = 2;
          "network.dns.disableIPv6" = true;
          "network.dns.disablePrefetch" = true;
          "network.file.disable_unc_paths" = true;
          "network.gio.supported-protocols" = "";
          "network.http.referer.XOriginPolicy" = 2;
          "network.http.referer.XOriginTrimmingPolicy" = 2;
          "network.http.referer.disallowCrossSiteRelaxingDefault.top_navigation" =
            true;
          "network.http.referer.trimmingPolicy" = 1;
          "network.http.speculative-parallel-limit" = 0;
          "network.predictor.enabled" = false;
          "network.prefetch-next" = false;
          "network.trr.mode" = 2;
          "network.trr.uri" = "https://mozilla.cloudflare-dns.com/dns-query";
          "pdfjs.enableScripting" = false;
          "pdfjs.enabledCache.state" = false;
          "pdfjs.migrationVersion" = 2;
          "permissions.default.shortcuts" = 2;
          "permissions.manager.defaultsUrl" = "";
          "pref.downloads.disable_button.edit_actions" = false;
          "privacy.annotate_channels.strict_list.enabled" = true;
          "privacy.clearOnShutdown.cache" = true;
          "privacy.clearOnShutdown.cookies" = true;
          "privacy.clearOnShutdown.downloads" = true;
          "privacy.clearOnShutdown.formdata" = true;
          "privacy.clearOnShutdown.history" = true;
          "privacy.clearOnShutdown.offlineApps" = true;
          "privacy.clearOnShutdown.sessions" = true;
          "privacy.clearOnShutdown.sitesettings" = false;
          "privacy.donottrackheader.enabled" = true;
          "privacy.donottrackheader.value" = 1;
          "privacy.fingerprintingProtection" = true;
          "privacy.firstparty.isolate" = true;
          "privacy.history.custom" = true;
          "privacy.partition.always_partition_third_party_non_cookie_storage" =
            true;
          "privacy.partition.always_partition_third_party_non_cookie_storage.exempt_sessionstorage" =
            true;
          "privacy.partition.network_state.ocsp_cache" = true;
          "privacy.partition.serviceWorkers" = true;
          "privacy.query_stripping.enabled" = true;
          "privacy.query_stripping.enabled.pbmode" = true;
          "privacy.resistFingerprinting" = true;
          "privacy.resistFingerprinting.block_mozAddonManager" = true;
          "privacy.sanitize.pending" = ''
            [{"id":"shutdown","itemsToClear":["cache","cookies","offlineApps"],"options":{}},{"id":"newtab-container","itemsToClear":[],"options":{}}]'';
          "privacy.sanitize.sanitizeOnShutdown" = true;
          "privacy.sanitize.timeSpan" = 0;
          "privacy.trackingprotection.emailtracking.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.userContext.enabled" = true;
          "privacy.userContext.ui.enabled" = true;
          "privacy.window.maxInnerHeight" = 900;
          "privacy.window.maxInnerWidth" = 1600;
          "security.OCSP.require" = true;
          "security.cert_pinning.enforcement_level" = 2;
          "security.pki.crlite_mode" = 2;
          "security.pki.sha1_enforcement_level" = 1;
          "security.remote_settings.crlite_filters.enabled" = true;
          "security.tls.enable_0rtt_data" = false;
          "services.settings.clock_skew_seconds" = 1;
          "services.sync.clients.lastSync" = 0;
          "services.sync.nextSync" = 0;
          "signon.autofillForms" = false;
          "signon.firefoxRelay.feature" = "disabled";
          "signon.formlessCapture.enabled" = false;
          "signon.generation.enabled" = false;
          "signon.management.page.breach-alerts.enabled" = false;
          "signon.rememberSignons" = false;
          "toolkit.coverage.endpoint.base" = "";
          "toolkit.coverage.opt-out" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.pioneer-new-studies-available" = true;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.server" = "data:,";
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "trailhead.firstrun.didSeeAboutWelcome" = true;
          "ui.context_menus.after_mouseup" = true;
          "webgl.disabled" = true;
          "widget.use-xdg-desktop-portal" = true;
        };
        extraConfig = "";
        userChrome = ''
          :root{
            --uc-autohide-toolbox-delay: 100ms; /* Wait 0.1s before hiding toolbars */
            --uc-toolbox-rotation: 82deg;  /* This may need to be lower on mac - like 75 or so */
          }

          :root[sizemode="maximized"]{
            --uc-toolbox-rotation: 88.5deg;
          }

          @media  (-moz-platform: windows){
            #navigator-toolbox:not(:-moz-lwtheme){ background-color: -moz-dialog !important; }
          }

          :root[sizemode="fullscreen"],
          #navigator-toolbox[inFullscreen]{ margin-top: 0 !important; }

          #navigator-toolbox{
            position: fixed !important;
            display: block;
            background-color: var(--lwt-accent-color,black) !important;
            transition: transform 0ms linear, opacity 0ms linear !important;
            transition-delay: var(--uc-autohide-toolbox-delay) !important;
            transform-origin: top;
            transform: rotateX(var(--uc-toolbox-rotation));
            opacity: 0;
            line-height: 0;
            z-index: 1;
            pointer-events: none;
          }

          #navigator-toolbox:hover,
          #navigator-toolbox:focus-within{
            transition-delay: 0ms !important;
            transform: rotateX(0);
            opacity: 1;
          }
          /* This ruleset is separate, because not having :has support breaks other selectors as well */
          #mainPopupSet:has(> #appMenu-popup:hover) ~ toolbox{
            transition-delay: 0ms !important;
            transform: rotateX(0);
            opacity: 1;
          }

          #navigator-toolbox > *{ line-height: normal; pointer-events: auto }

          #navigator-toolbox,
          #navigator-toolbox > *{
            width: 100vw;
            -moz-appearance: none !important;
          }

          /* These two exist for oneliner compatibility */
          #nav-bar{ width: var(--uc-navigationbar-width,100vw) }
          #TabsToolbar{ width: calc(100vw - var(--uc-navigationbar-width,0px)) }

          /* Don't apply transform before window has been fully created */
          :root:not([sessionrestored]) #navigator-toolbox{ transform:none !important }

          :root[customizing] #navigator-toolbox{
            position: relative !important;
            transform: none !important;
            opacity: 1 !important;
          }

          #navigator-toolbox[inFullscreen] > #PersonalToolbar,
          #PersonalToolbar[collapsed="true"]{ display: none }

          /* Uncomment this if tabs toolbar is hidden with hide_tabs_toolbar.css */
           /*#titlebar{ margin-bottom: -9px }*/

          /* Uncomment the following for compatibility with tabs_on_bottom.css - this isn't well tested though */
          /*
          #navigator-toolbox{ flex-direction: column; display: flex; }
          #titlebar{ order: 2 }
          */
        '';
      };
    };
  };
}
