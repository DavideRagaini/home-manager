{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/firefox";
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
      # DisableMenuBar = "never";
      DisablePasswordReveal = true;
      DisablePocket = true;
      DisableProfileImport = true;
      # DisableSetDesktopBackgroud = true;
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
        Uninstall = {
          Amazon = "amazondotcom@search.mozilla.org";
          Bing = "bing@search.mozilla.org";
          DuckDuckGo = "ddg@search.mozilla.org";
          eBay = "ebay@search.mozilla.org";
          # Google = "google@search.mozilla.org";
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
        Locked = false;
        StartPage = "homepage";
      };

      # NewTabPage = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
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
          privateDefault = "google";
          default = "google";
          # order = [  ];

          engines = {
            "google" = {
              urls = [
                {
                  template = "https://www.google.com/search";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = [ "@g" ];
            };

            "Yewtube" = {
              urls = [
                {
                  template = "https://yewtu.be/search";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = [ "@y" ];
            };

            "Nix Packages stable" = {
              urls = [
                {
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
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "NixOS Options stable" = {
              urls = [
                {
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
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@no" ];
            };

            "NixOS Wiki" = {
              urls = [
                {
                  template = "https://nixos.wiki/index.php";
                  params = [
                    {
                      name = "search";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              # iconUpdateURL = "https://nixos.wiki/favicon.png";
              # updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@nw" ];
            };

            "Home Manager Packages" = {
              urls = [
                {
                  template = "https://searchix.ovh/";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = [ "@hp" ];
            };

            "Home Manager Options" = {
              urls = [
                {
                  template = "https://mipmip.github.io/home-manager-option-search/";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = [ "@ho" ];
            };

            "wikipedia" = {
              metaData = {
                hidden = true;
                alias = "w";
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

            "bing".metaData.hidden = true;

          };
        };
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          darkreader
          hover-zoom-plus
          # keepassxc-browser
          bitwarden
          # libredirect
          ublock-origin
          # vimium
          # violentmonkey
          tridactyl
        ];

        settings = {
          "gfx.canvas.accelerated.cache-size" = 256;
          "gfx.webrender.layer-compositor" = true;

          # /****************************************************************************
          # * SECTION: SECUREFOX                                                       *
          # ****************************************************************************/
          # /** TRACKING PROTECTION ***/
          "browser.contentblocking.category" = "strict";
          "browser.download.start_downloads_in_tmp_dir" = true;
          "browser.uitour.enabled" = false;
          "privacy.globalprivacycontrol.enabled" = true;

          # /** OCSP & CERTS / HPKP ***/
          "security.OCSP.enabled" = 0;
          "privacy.antitracking.isolateContentScriptResources" = true;
          "security.csp.reporting.enabled" = false;

          # /** SSL / TLS ***/
          "security.ssl.treat_unsafe_negotiation_as_broken" = true;
          "browser.xul.error_pages.expert_bad_cert" = true;
          "security.tls.enable_0rtt_data" = false;

          # /** DISK AVOIDANCE ***/
          "browser.cache.disk.enable" = false;
          "browser.privatebrowsing.forceMediaMemoryCache" = true;
          "media.memory_cache_max_size" = 65536;
          "browser.sessionstore.interval" = 60000;

          # /** SHUTDOWN & SANITIZING ***/
          # "privacy.history.custom" = true;
          # "browser.privatebrowsing.resetPBM.enabled" = true;

          # /** SPECULATIVE LOADING ***/
          "network.http.speculative-parallel-limit" = 0;
          "network.dns.disablePrefetch" = true;
          "network.dns.disablePrefetchFromHTTPS" = true;
          "browser.urlbar.speculativeConnect.enabled" = false;
          "browser.places.speculativeConnect.enabled" = false;
          "network.prefetch-next" = false;

          # /** SEARCH / URL BAR ***/
          "browser.urlbar.trimHttps" = true;
          "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
          "browser.search.separatePrivateDefault.ui.enabled" = true;
          "browser.search.suggest.enabled" = false;
          "browser.urlbar.quicksuggest.enabled" = false;
          "browser.urlbar.groupLabels.enabled" = false;
          "browser.formfill.enable" = false;
          "network.IDN_show_punycode" = true;

          # /** HTTPS-ONLY MODE ***/
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_error_page_user_suggestions" = true;

          # /** PASSWORDS ***/
          "signon.formlessCapture.enabled" = false;
          "signon.privateBrowsingCapture.enabled" = false;
          "network.auth.subresource-http-auth-allow" = 1;
          "editor.truncate_user_pastes" = false;

          # /** EXTENSIONS ***/
          "extensions.enabledScopes" = 5;

          # /** HEADERS / REFERERS ***/
          "network.http.referer.XOriginTrimmingPolicy" = 2;

          # /** CONTAINERS ***/
          "privacy.userContext.ui.enabled" = true;

          # /** VARIOUS ***/
          "pdfjs.enableScripting" = false;

          # /** SAFE BROWSING ***/
          "browser.safebrowsing.downloads.remote.enabled" = false;

          # /** MOZILLA ***/
          "permissions.default.desktop-notification" = 2;
          "permissions.default.geo" = 2;
          "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
          "browser.search.update" = false;
          "permissions.manager.defaultsUrl" = "";
          "extensions.getAddons.cache.enabled" = false;

          # /** TELEMETRY ***/
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "data:,";
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.coverage.opt-out" = true;
          "toolkit.coverage.endpoint.base" = "";
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "datareporting.usage.uploadEnabled" = false;

          # /** EXPERIMENTS ***/
          "app.shield.optoutstudies.enabled" = false;
          "app.normandy.enabled" = false;
          "app.normandy.api_url" = "";

          # /** CRASH REPORTS ***/
          "breakpad.reportURL" = "";
          "browser.tabs.crashReporting.sendReport" = false;

          # /****************************************************************************
          # * SECTION: PESKYFOX                                                        *
          # ****************************************************************************/
          # /** MOZILLA UI ***/
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "browser.discovery.enabled" = false;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
          "browser.preferences.moreFromMozilla" = false;
          "browser.aboutConfig.showWarning" = false;
          "browser.startup.homepage_override.mstone" = "ignore";
          "browser.aboutwelcome.enabled" = false;
          "browser.profiles.enabled" = true;

          # /** THEME ADJUSTMENTS ***/
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.compactmode.show" = true;
          "browser.privateWindowSeparation.enabled" = false;

          # /** AI ***/
          "browser.ai.control.default" = "blocked";
          "browser.ml.enable" = false;
          "browser.ml.chat.enabled" = false;
          "browser.ml.chat.menu" = false;
          "browser.tabs.groups.smart.enabled" = false;
          "browser.ml.linkPreview.enabled" = false;

          # /** FULLSCREEN NOTICE ***/
          "full-screen-api.transition-duration.enter" = "0 0";
          "full-screen-api.transition-duration.leave" = "0 0";
          "full-screen-api.warning.timeout" = 0;

          # /** URL BAR ***/
          "browser.urlbar.trending.featureGate" = false;

          # /** NEW TAB PAGE ***/
          "browser.newtabpage.activity-stream.default.sites" = "";
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;

          # /** DOWNLOADS ***/
          "browser.download.manager.addToRecentDocs" = false;

          # /** PDF ***/
          "browser.download.open_pdf_attachments_inline" = true;

          # /** TAB BEHAVIOR ***/
          "browser.bookmarks.openInTabClosesMenu" = false;
          "browser.menu.showViewImageInfo" = true;
          "findbar.highlightAll" = true;
          "layout.word_select.eat_space_to_next_word" = false;
        };

        # extraConfig = ''
        #   # var key_bookmarks = document.getElementById('viewBookmarksSidebarKb');
        #   # var key_history = document.getElementById('viewHistorySidebarKb');
        #   # if (key_bookmark) key_bookmark.remove();
        #   # else if (key_history) key_history.remove();
        # '';

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
          #fullscr-toggler { display:none !important; }
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

        # userContent = ''
        #   /* --- HIDE SCROLLBAR ---------------------------------- */
        #   * {
        #     scrollbar-width: none !important;
        #   }
        #   /* --- NEWTAB WALLPAPER ---------------------------------- */
        #   @-moz-document url-prefix(about:home), url-prefix(about:newtab) {
        #     .click-target-container *,
        #     .top-sites-list * {
        #       color: #fff !important ;
        #       text-shadow: 2px 2px 2px #000 !important ;
        #     }
        #     body {
        #       background: url(../../../../pic/current/firefox) !important ;
        #       background-size: cover !important ;
        #     }
        #   }
        # '';
      };
    };
  };
}
