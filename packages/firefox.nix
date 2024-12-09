{ config, pkgs, ... }:

{
  home.sessionVariables = { MOZ_USE_XINPUT2 = "1"; };

  programs.firefox = {
    enable = true;
    # https://mozilla.github.io/policy-templates/
    policies = {
      "3rdparty" = {
        Extensions = {
          # "addon@darkreader.org" = {};
          # "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          #   uploadBackup = "\${home}/Documents/backups/vimium-options.json";
          # };
          "uBlock0@raymondhill.net" = {
            advancedUserEnable = true;
            adminSettings = {
              selectedFilterLists = [
                "ublock-privacy"
                "ublock-badware"
                "ublock-filters"
                "ublock-quick-fixes"
                "ublock-unbreak"
                "easylist"
                "easyprivacy"
                "urlhaus-1"
                "plowe-0"
                "adguard-generic"
                "adguard-mobile"
                "adguard-spyware"
                "adguard-spyware-url"
                "block-lan"
                "curben-phishing"
                "dpollock-0"
                "adguard-mobile-app-banners"
                "adguard-other-annoyances"
                "adguard-popup-overlays"
                "adguard-social"
                "adguard-widgets"
                "adguard-cookies"
                "ublock-cookies-adguard"
                "easylist-chat"
                "easylist-newsletters"
                "easylist-notifications"
                "easylist-annoyances"
                "fanboy-social"
                "fanboy-cookiemonster"
                "ublock-cookies-easylist"
                "fanboy-thirdparty_social"
                "ublock-annoyances"
                "ALB-0"
                "BGR-0"
                "CZE-0"
                "DEU-0"
                "EST-0"
                "spa-0"
                "spa-1"
                "FIN-0"
                "FRA-0"
                "GRC-0"
                "HRV-0"
                "HUN-0"
                "ISL-0"
                "ITA-0"
                "LVU-0"
                "LTV-0"
                "LVA-0"
                "MKD-0"
                "NLD-0"
                "NOR-0"
                "POL-0"
                "POL-2"
                "ROU-1"
                "RUS-0"
                "SWE-1"
                "SVN-0"
              ];
            };
          };
        };
      };
      CaptivePortal = false;
      Cookies = {
        Default = false;
        AcceptThirdParty = "never";
        # ExpireAtSessionEnd = ;
        RejectTracker = true;
        Behavior = "reject-foreing";
        BehaviorPrivateBrowsing = "reject";
        Locked = false;
      };
      DefaultDownloadDirectory = "\${home}/dwn";
      DisableBuiltinPDFViewer = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisableMasterPasswordCreation = true;
      DisableMenuBar = "never";
      DisablePasswordReveal = true;
      DisablePocket = true;
      DisableProfileImport = true;
      DisableSetDesktopBackgroud = true;
      DisableTelemetry = true;
      DNSOverHTTPS = {
        Enabled = true;
        ProviderURL = "https://mozilla.cloudflare-dns.com/dns-query";
      };
      DontCheckDefaultBrowser = false;
      EncryptedMediaExtensions = {
        Enabled = false;
        Locked = true;
      };
      Extensions = {
        # Install = {
        #   uBlockOrigin =
        #     "https://addons.mozilla.org/firefox/downloads/file/4198829/ublock_origin-1.54.0.xpi";
        #   DarkReader =
        #     "https://addons.mozilla.org/firefox/downloads/file/4205543/darkreader-4.9.73.xpi";
        #   KeePassXC =
        #     "https://addons.mozilla.org/firefox/downloads/file/4200248/keepassxc_browser-1.8.10.xpi";
        #   # Vimium =
        #   #   "https://addons.mozilla.org/firefox/downloads/file/4191523/vimium_ff-2.0.6.xpi";
        # };
        Uninstall = {
          Amazon = "amazondotcom@search.mozilla.org";
          Bing = "bing@search.mozilla.org";
          DuckDuckGo = "ddg@search.mozilla.org";
          eBay = "ebay@search.mozilla.org";
          Google = "google@search.mozilla.org";
          Wikipedia = "wikipedia@search.mozilla.org";
          Alpenglow = "firefox-alpenglow@mozilla.org";
        };
      };
      FirefoxHome = {
        Search = false;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
        Locked = false;
      };
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
        Locked = true;
      };
      HardwareAcceleration = true;
      # PopupBolocking = {
      #   Allow = [];
      # Default = ;
      # Locked = ;
      Homepage = {
        URL = "file:///home/davide/sources/startpage/index.html";
        Locked = true;
        Additional = {
          "1" = "file:///home/davide/sources/startpage/index.html";
          "2" = "file:///home/davide/.local/src/startpage/index.html";
        };
        StartPage = "homepage";
      };
      NewTabPage = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      OverrideFirstRunPage = "";
      PDFjs = {
        Enable = false;
        EnablePermissions = false;
      };
      PasswordManagerEnabled = false;
      PictureInPicture = {
        Enabled = false;
        Locked = false;
      };
      SearchBar = "unified";
      UserMessaging = {
        WhatsNew = false;
        FeatureRecommendations = false;
        UrlBarInterventions = false;
        SkipOnboarding = true;
        MoreFromMozilla = false;
        ExtensionRecommendations = false;
        Locked = true;
      };
    };
    # package = pkgs.firefox;
    # package =
    #   pkgs.firefox.override { cfg = { enableTridactylNative = true; }; };
    package = pkgs.firefox.override {
      # See nixpkgs' firefox/wrapper.nix to check which options you can use
      nativeMessagingHosts = [
        # Tridactyl native connector
        pkgs.tridactyl-native
      ];
    };
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
            };
            "USDA" = {
              urls = [{
                template = "https://fdc.nal.usda.gov/fdc-app.html#/";
                params = [{
                  name = "query";
                  value = "{searchTerms}";
                }];
              }];
              definedAliases = [ "usda" ];
            };
            "Yewtube" = {
              urls = [{
                template = "https://yewtu.be/search";
                params = [{
                  name = "q";
                  value = "{searchTerms}";
                }];
              }];
              definedAliases = [ "y" ];
            };
            "Nix Packages stable" = {
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
            "Nix Packages unstable" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }];
              icon =
                "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "npu" ];
            };
            "NixOS Options stable" = {
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
            "NixOS Options unstable" = {
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }];
              icon =
                "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "nou" ];
            };
            "NixOS Wiki" = {
              urls = [{
                template = "https://nixos.wiki/index.php";
                params = [{
                  name = "search";
                  value = "{searchTerms}";
                }];
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
            "prowlarr | indexer" = {
              urls = [{ template = "localhost:9696"; }];
              definedAliases = [ "tp" ];
            };
            "lidarr | music" = {
              urls = [{ template = "localhost:8686"; }];
              definedAliases = [ "tm" ];
            };
            "sonarr | series" = {
              urls = [{ template = "localhost:8989"; }];
              definedAliases = [ "ts" ];
            };
            "readarr | books" = {
              urls = [{ template = "localhost:8787"; }];
              definedAliases = [ "tb" ];
            };
            "radarr | movies" = {
              urls = [{ template = "localhost:7878"; }];
              definedAliases = [ "tm" ];
            };
            "bazarr | subtitles" = {
              urls = [{ template = "localhost:6767"; }];
              definedAliases = [ "tb" ];
            };
            "Wikipedia (en)" = {
              metaData = {
                hidden = true;
                alias = "w";
              };
            };
            "Google" = {
              metaData = {
                hidden = true;
                alias = "g";
              };
            };
            "Amazon" = {
              metaData = {
                hidden = true;
                alias = "az";
              };
            };
            "Ebay" = {
              metaData = {
                hidden = true;
                alias = "eb";
              };
            };
            "Bing".metaData.hidden = true;
          };
        };
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          darkreader
          hover-zoom-plus
          keepassxc-browser
          libredirect
          ublock-origin
          # vimium
          violentmonkey
          tridactyl
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
          "accessibility.force_disabled" = 1;
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
          "browser.compactmode.show" = true;
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
          "browser.bookmarks.showMobileBookmarks" = false;
          "browser.startup.page" = 1;
          "browser.tabs.animate" = false;
          "browser.tabs.closeWindowWithLastTab" = false;
          "browser.tabs.crashReporting.sendReport" = false;
          "browser.tabs.tabmanager.enabled" = false;
          "browser.tabs.warnOnClose" = false;
          "browser.theme.content-theme" = 0;
          "browser.theme.toolbar-theme" = 0;
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.translations.automaticallyPopup" = false;
          # "browser.uiCustomization.state" = ''
          #   browser.uiCustomization.state	{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["_ef87d84c-2127-493f-b952-5b4e744245bc_-browser-action","_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","urlbar-container","fxa-toolbar-menu-button","downloads-button","ublock0_raymondhill_net-browser-action","addon_darkreader_org-browser-action","keepassxc-browser_keepassxc_org-browser-action","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","7esoorv3_alefvanoon_anonaddy_me-browser-action","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button","firefox-view-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["developer-button","ublock0_raymondhill_net-browser-action","addon_darkreader_org-browser-action","keepassxc-browser_keepassxc_org-browser-action","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","7esoorv3_alefvanoon_anonaddy_me-browser-action","_ef87d84c-2127-493f-b952-5b4e744245bc_-browser-action","_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","unified-extensions-area","TabsToolbar","toolbar-menubar","widget-overflow-fixed-list"],"currentVersion":20,"newElementCount":7}
          # '';
          "browser.uidensity" = 1;
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
          # "datareporting.healthreport.uploadEnabled" = false;
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
          # "extensions.webextensions.ExtensionStorageIDB.migrated.addon@darkreader.org" =
          #   true;
          # "extensions.webextensions.ExtensionStorageIDB.migrated.keepassxc-browser@keepassxc.org" =
          #   true;
          # "extensions.webextensions.ExtensionStorageIDB.migrated.screenshots@mozilla.org" =
          #   true;
          # "extensions.webextensions.ExtensionStorageIDB.migrated.tridactyl.vim.betas@cmcaine.co.uk" =
          #   true;
          # "extensions.webextensions.ExtensionStorageIDB.migrated.uBlock0@raymondhill.net" =
          #   true;
          "extensions.webextensions.restrictedDomains" = "";
          "fission.autostart" = true;
          # "font.size.systemFontScale" = 120;
          "font.size.variable.x-western" = 12;
          "full-screen-api.ignore-widgets" = true;
          "full-screen-api.transition-duration.enter" = [ 0 0 ];
          "full-screen-api.transition-duration.leave" = [ 0 0 ];
          "full-screen-api.transition.timeout" = 1000;
          "full-screen-api.warnint.timeout" = 0;
          "full-screen-api.delay" = "-1";
          "full-screen-api.timeout" = "-1";
          "gecko.handlerService.defaultHandlersVersion" = 1;
          "general.autoScroll" = true;
          "general.smoothScroll" = false;
          "general.useragent.override" =
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36";
          "geo.enabled" = false;
          "geo.provider.network.url" =
            "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
          "geo.provider.use_geoclue" = false;
          "geo.provider.use_gpsd" = false;
          # "gfx.webrender.all" = true;
          # "gfx.webrender.enabled" = true;
          "image.animation_mode" = "once";
          "intl.accept_languages" = "en-US, en";
          "javascript.use_us_english_locale" = true;
          # "layout.css.devPixelsPerPx" = 2; # scale x2
          "media.autoplay.default" = 5;
          "media.block-play-until-visible" = true;
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
          "privacy.donottrackheader.enabled" = false;
          "privacy.donottrackheader.value" = 0;
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
          "toolkit.cosmeticAnimations.enabled" = false;
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
          "ui.prefersReducedMotion" = 0;
          # "ui.textScaleFactor" = 85;
          "webgl.disabled" = true;
          "widget.use-xdg-desktop-portal" = true;
          # FASTERFOX
          "dom.enable_web_task_scheduling" = true;
          "dom.security.sanitizer.enabled" = true;
          "gfx.canvas.accelerated.cache-items" = 4096;
          "gfx.canvas.accelerated.cache-size" = 512;
          "gfx.content.skia-font-cache-size" = 12;
          "image.mem.decode_bytes_at_a_time" = 32768;
          "layout.css.grid-template-masonry-value.enabled" = true;
          "layout.css.has-selector.enabled" = true;
          "network.buffer.cache.count" = 128;
          "network.buffer.cache.size" = 262144;
          "network.dns.max_high_priority_threads" = 8;
          "network.dnsCacheExpiration" = 3600;
          "network.http.max-connections" = 1800;
          "network.http.max-persistent-connections-per-server" = 10;
          "network.http.max-urgent-start-excessive-connections-per-host" = 5;
          "network.http.pacing.requests.burst" = 14;
          "network.http.pacing.requests.enabled" = false;
          "network.http.pacing.requests.min-parallelism" = 10;
          "network.ssl_tokens_cache_capacity" = 10240;
          # SECUREFOX
          "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
          "browser.download.start_downloads_in_tmp_dir" = false;
          "browser.privatebrowsing.forceMediaMemoryCache" = true;
          "browser.search.separatePrivateDefault.ui.enabled" = true;
          "browser.sessionstore.interval" = 60000;
          "browser.tabs.firefox-view" = false;
          "browser.uitour.enabled" = false;
          "browser.urlbar.update2.engineAliasRefresh" = true;
          "dom.security.https_first" = true;
          "dom.security.https_only_mode_error_page_user_suggestions" = true;
          "editor.truncate_user_pastes" = false;
          "extensions.postDownloadThirdPartyPrompt" = false;
          "identity.fxaccounts.enabled" = false;
          "network.IDN_show_punycode" = true;
          "network.cookie.sameSite.noneRequiresSecure" = true;
          "network.http.referer.XOriginTrimmingPolicy" = 2;
          "permissions.default.desktop-notification" = 2;
          "permissions.default.geo" = 2;
          "privacy.globalprivacycontrol.enabled" = true;
          "privacy.globalprivacycontrol.functionality.enabled" = true;
          "security.OCSP.enabled" = 0;
          "security.insecure_connection_text.enabled" = true;
          "security.insecure_connection_text.pbmode.enabled" = true;
          "security.mixed_content.block_display_content" = true;
          "security.mixed_content.upgrade_display_content" = true;
          "security.mixed_content.upgrade_display_content.image" = true;
          "security.ssl.treat_unsafe_negotiation_as_broken" = true;
          "urlclassifier.features.socialtracking.skipURLs" =
            "*.instagram.com, *.twitter.com, *.twimg.com";
          "urlclassifier.trackingSkipURLs" =
            "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
          "webchannel.allowObject.urlWhitelist" = "";
          # PESKYFOX
          "browser.privatebrowsing.vpnpromourl" = "";
          "browser.shell.checkDefaultBrowser" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" =
            false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" =
            false;
          "browser.preferences.moreFromMozilla" = false;
          "browser.display.focus_ring_on_anything" = true;
          "browser.display.focus_ring_style" = 0;
          "browser.display.focus_ring_width" = 0;
          "layout.css.prefers-color-scheme.content-override" = 2;
          "browser.privateWindowSeparation.enabled" = false;
          "cookiebanners.service.mode" = 1;
          "cookiebanners.service.mode.privateBrowsing" = 1;
          "cookiebanners.service.enableGlobalRules" = true;
          "browser.urlbar.suggest.engines" = false;
          "browser.urlbar.suggest.calculator" = true;
          "browser.urlbar.unitConversion.enabled" = true;
          "browser.urlbar.trending.featureGate" = false;
          "browser.download.useDownloadDir" = true;
          "browser.download.always_ask_before_handling_new_types" = true;
          "browser.download.manager.addToRecentDocs" = false;
          "browser.download.open_pdf_attachments_inline" = true;
          "browser.bookmarks.openInTabClosesMenu" = false;
          "browser.menu.showViewImageInfo" = true;
          "findbar.highlightAll" = true;
          "layout.word_select.eat_space_to_next_word" = false;
          # user.js
          "content.notify.interval" = 100000;
          "browser.cache.jsbc_compression_level" = 3;
          "media.memory_cache_max_size" = 65536;
          "media.cache_readahead_limit" = 7200;
          "media.cache_resume_threshold" = 3600;
          "signon.privateBrowsingCapture.enabled" = false;
          "full-screen-api.warning.delay" = -1;
          "full-screen-api.warning.timeout" = 0;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
        };
        extraConfig = ''
          # var key_bookmarks = document.getElementById('viewBookmarksSidebarKb');
          # var key_history = document.getElementById('viewHistorySidebarKb');
          # if (key_bookmark) key_bookmark.remove();
          # else if (key_history) key_history.remove();
        '';
        userChrome = ''
          :root {
            --tab-active-bg-color: #2e2d6e;
            --tab-inactive-bg-color: #282a36;
            --tab-active-fg-fallback-color: #f8f8f2;
            --tab-inactive-fg-fallback-color: #f8f8f2;
            --urlbar-focused-bg-color: #1c1b22;
            --urlbar-not-focused-bg-color: #282a36;
            --toolbar-bgcolor: #1c1b22 !important;
            --tab-font: 'IosevkaTermSlab Nerd Font Propo';
            --urlbar-font: 'IosevkaTermSlab Nerd Font Propo';

            /* try increasing if you encounter problems */
            --urlbar-height-setting: 24px;
            --tab-min-height: 22px !important;

            /* I don't recommend you touch this unless you know what you're doing */
            --arrowpanel-menuitem-padding: 2px !important;
            --arrowpanel-border-radius: 0px !important;
            --arrowpanel-menuitem-border-radius: 0px !important;
            --toolbarbutton-border-radius: 0px !important;
            --toolbarbutton-inner-padding: 0px 2px !important;
            --toolbar-field-focus-background-color: var(--urlbar-focused-bg-color) !important;
            --toolbar-field-background-color: var(--urlbar-not-focused-bg-color) !important;
            --toolbar-field-focus-border-color: transparent !important;
          }
          /* --- GENERAL DEBLOAT ---------------------------------- */

          /* Bottom left page loading status or url preview */
          #statuspanel { display: none !important; }

          /* remove radius from right-click popup */
          menupopup, panel { --panel-border-radius: 0px !important; }
          menu, menuitem, menucaption { border-radius: 0px !important; }

          /* no stupid large buttons in right-click menu */
          menupopup > #context-navigation { display: none !important; }
          menupopup > #context-sep-navigation { display: none !important; }

          /* --- DEBLOAT NAVBAR ----------------------------------- */

          /* #back-button { display: none; } */
          /* #forward-button { display: none; } */
          /* #reload-button { display: none; } */
          /* #stop-button { display: none; } */
          /* #home-button { display: none; } */
          #library-button { display: none; }
          #fxa-toolbar-menu-button { display: none; }
          /* empty space before and after the url bar */
          #customizableui-special-spring1, #customizableui-special-spring2 { display: none; }
          .private-browsing-indicator-with-label { display: none; }

          /* --- STYLE NAVBAR ------------------------------------ */

          /* remove padding between toolbar buttons */
          toolbar .toolbarbutton-1 { padding: 0 0 !important; }

          /* add it back to the downloads button, otherwise it's too close to the urlbar */
          #downloads-button {
            margin-left: 2px !important;
          }

          /* add padding to the right of the last button so that it doesn't touch the edge of the window */
          #PanelUI-menu-button {
            padding: 0px 4px 0px 0px !important;
          }

          #urlbar-container {
            --urlbar-container-height: var(--urlbar-height-setting) !important;
            margin-left: 0 !important;
            margin-right: 0 !important;
            padding-top: 0 !important;
            padding-bottom: 0 !important;
            font-family: var(--urlbar-font, 'monospace');
            font-size: 11px;
          }

          #urlbar {
            --urlbar-height: var(--urlbar-height-setting) !important;
            --urlbar-toolbar-height: var(--urlbar-height-setting) !important;
            min-height: var(--urlbar-height-setting) !important;
            border-color: var(--lwt-toolbar-field-border-color, hsla(240,5%,5%,.25)) !important;
          }

          #urlbar-input {
            margin-left: 0.8em !important;
            margin-right: 0.4em !important;
          }

          #navigator-toolbox {
            border: none !important;
          }

          /* keep pop-up menus from overlapping with navbar */
          #widget-overflow { margin: 4px !important; }
          #customizationui-widget-panel { margin: 4px !important; }
          #unified-extensions-panel { margin-top: 4px !important; }
          #appMenu-popup { margin-top: 4px !important; }

          /* --- UNIFIED EXTENSIONS BUTTON ------------------------ */

          /* make extension icons smaller */
          #unified-extensions-view {
            --uei-icon-size: 16px;
          }

          /* hide bloat */
          .unified-extensions-item-message-deck,
          #unified-extensions-view > .panel-header,
          #unified-extensions-view > toolbarseparator,
          #unified-extensions-manage-extensions {
            display: none !important;
          }

          /* add 3px padding on the top and the bottom of the box */
          .panel-subview-body {
            padding: 3px 0px !important;
          }

          #unified-extensions-view .toolbarbutton-icon {
            padding: 0 !important;
          }

          .unified-extensions-item-contents {
            line-height: 1 !important;
            white-space: nowrap !important;
          }

          #unified-extensions-panel .unified-extensions-item {
            margin-block: 0 !important;
          }

          .toolbar-menupopup :is(menu, menuitem), .subview-subheader, panelview
          .toolbarbutton-1, .subviewbutton, .widget-overflow-list .toolbarbutton-1 {
            padding: 4px !important;
          }

          /* --- DEBLOAT URLBAR ----------------------------------- */

          #identity-box { display: none; }
          #pageActionButton { display: none; }
          #pocket-button { display: none; }
          #urlbar-zoom-button { display: none; }
          #tracking-protection-icon-container { display: none !important; }
          #reader-mode-button{ display: none !important; }
          #star-button { display: none; }
          #star-button-box:hover { background: inherit !important; }

          /* Go to arrow button at the end of the urlbar when searching */
          #urlbar-go-button { display: none; }

          /* remove container indicator from urlbar */
          #userContext-label, #userContext-indicator { display: none !important;}

          /* --- STYLE TAB TOOLBAR -------------------------------- */

          #titlebar {
            --proton-tab-block-margin: 0px !important;
            --tab-block-margin: 0px !important;
          }

          #TabsToolbar, .tabbrowser-tab {
            max-height: var(--tab-min-height) !important;
            font-size: 11px !important;
          }

          /* Change color of normal tabs */
          tab:not([selected="true"]) {
            background-color: var(--tab-inactive-bg-color) !important;
            color: var(--identity-icon-color, var(--tab-inactive-fg-fallback-color)) !important;
          }

          tab {
            font-family: var(--tab-font, monospace);
            font-weight: bold;
            border: none !important;
            padding-top: 0 !important;
          }

          .tab-content {
            padding: 0 0 0 var(--tab-inline-padding);
          }

          .tab-background {
            margin-block: 0 !important;
            min-height: var(--tab-min-height);
            outline-offset: 0 !important;
          }

          /* safari style tab width */
          .tabbrowser-tab[fadein] {
            max-width: 100vw !important;
            border: none
          }

          /* Hide close button on tabs */
          #tabbrowser-tabs .tabbrowser-tab .tab-close-button { display: none !important; }

          /* disable favicons in tab */
          /* .tab-icon-stack:not([pinned]) { display: none !important; } */

          .tabbrowser-tab {
            /* remove border between tabs */
            padding-inline: 0px !important;
            /* reduce fade effect of tab text */
            --tab-label-mask-size: 1em !important;
            /* fix pinned tab behaviour on overflow */
            overflow-clip-margin: 0px !important;
          }

          /* Tab: selected colors */
          #tabbrowser-tabs .tabbrowser-tab[selected] .tab-content {
            background: var(--tab-active-bg-color) !important;
            color: var(--identity-icon-color, var(--tab-active-fg-fallback-color)) !important;
          }

          /* Tab: hovered colors */
          #tabbrowser-tabs .tabbrowser-tab:hover:not([selected]) .tab-content {
            background: var(--tab-active-bg-color) !important;
          }

          /* hide window controls */
          .titlebar-buttonbox-container { display: none; }

          /* remove titlebar spacers */
          .titlebar-spacer { display: none !important; }

          /* disable tab shadow */
          #tabbrowser-tabs:not([noshadowfortests]) .tab-background:is([selected], [multiselected]) {
              box-shadow: none !important;
          }

          /* remove dark space between pinned tab and first non-pinned tab */
          #tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs]) >
          #tabbrowser-arrowscrollbox >
          .tabbrowser-tab:nth-child(1 of :not([pinned], [hidden])) {
            margin-inline-start: 0px !important;
          }

          /* remove dropdown menu button which displays all tabs on overflow */
          #alltabs-button { display: none !important }

          /* fix displaying of pinned tabs on overflow */
          #tabbrowser-tabs:not([secondarytext-unsupported]) .tab-label-container {
            height: var(--tab-min-height) !important;
          }

          #tabbrowser-tabs {
            min-height: var(--tab-min-height) !important;
          }

          /* remove overflow scroll buttons */
          #scrollbutton-up, #scrollbutton-down { display: none !important; }

          /* remove new tab button */
          #tabs-newtab-button {
            display: none !important;
          }

          /* hide private browsing indicator */
          #private-browsing-indicator-with-label {
            display: none;
          }

          /* --- AUTOHIDE NAVBAR ---------------------------------- */

          #nav-bar,
          #urlbar {
            transform: translateY(calc(0px - var(--urlbar-height-setting)));
            opacity: 0;
          }

          #navigator-toolbox {
            min-height: var(--tab-min-height) !important;
            height: var(--tab-min-height) !important;
          }

          #navigator-toolbox:focus-within {
            min-height: calc(var(--urlbar-height-setting) + var(--tab-min-height)) !important;
            height: calc(var(--urlbar-height-setting) + var(--tab-min-height)) !important;
            transform: translateY(calc(0px - var(--tab-min-height)));
          }

          #TabsToolbar {
            transform: translateY(var(--tab-min-height));
          }

          #nav-bar:focus-within {
            transform: translateY(var(--tab-min-height));
            opacity: 1;
          }

          #urlbar:focus-within {
            transform: translateY(0);
            opacity: 1;
          }
        '';
        userContent = ''
          /* --- HIDE SCROLLBAR ---------------------------------- */
          * {
            scrollbar-width: none !important;
          }

          /* --- NEWTAB WALLPAPER ---------------------------------- */
          @-moz-document url-prefix(about:home), url-prefix(about:newtab) {
            .click-target-container *,
            .top-sites-list * {
              color: #fff !important ;
              text-shadow: 2px 2px 2px #000 !important ;
            }
            body {
              background: url(../../../../pic/current/firefox) !important ;
              background-size: cover !important ;
            }
          }
        '';
      };
    };
  };
}
