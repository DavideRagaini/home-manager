{ lib, pkgs, ... }:

with lib.hm.gvariant;

{
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "yaru-theme";
      package = pkgs.yaru-theme;
    };

    cursorTheme = {
      name = "Catppuccin-Macchiato-Dark-Cursors";
      package = pkgs.catppuccin-cursors.macchiatoDark;

    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = "yaru";

  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.dash-to-panel
    gnomeExtensions.forge
    gnomeExtensions.just-perfection
    gnomeExtensions.space-bar
    gnomeExtensions.vitals
    gnomeExtensions.quick-settings-tweaker
    gnomeExtensions.no-titlebar-when-maximized
    # gnomeExtensions.caffeine
    # gnomeExtensions.cpufreq
    # gnomeExtensions.tray-icons-reloaded
    # gnomeExtensions.user-themes
  ];

  dconf.settings = {
    # "org/gnome/control-center/last-panel" = "background";

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "Vitals@CoreCoding.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        "clipboard-indicator@tudmotu.com"
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "forge@jmmaranan.com"
        "just-perfection-desktop@just-perfection"
        "space-bar@luchrioh"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        "quick-settings-tweaks@qwreey"
        "no-titlebar-when-maximized@alec.ninja"
        "dash-to-panel@jderose9.github.com"
        # "caffeine@patapon.info"
        # "trayIconsReloaded@selfmade.pl"
      ];
      # extensions.user-theme.name = "Yaru-purple";
      # extensions.just-perfection.theme = false;
      switch-to-application-1 = [ "unset" ];
      switch-to-application-2 = [ "unset" ];
      switch-to-application-3 = [ "unset" ];
      switch-to-application-4 = [ "unset" ];
      switch-to-application-5 = [ "unset" ];
      switch-to-application-6 = [ "unset" ];
      switch-to-application-7 = [ "unset" ];
      switch-to-application-8 = [ "unset" ];
      switch-to-application-9 = [ "unset" ];
      # keybindings = {
        # toggle-application-view = [ "<Primary><Super>p" ];
      # };
      # app-switcher.current-workspace-only = false;
      # ubuntu = { color-scheme = "prefer-dark"; };
    };

    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [
        # 1
        "emacs.desktop:1"
        "emacsclient.desktop:1"
        # 2
        "Alacritty.desktop:2"
        "org.codeberg.dnkl.foot.desktop:2"
        "org.codeberg.dnkl.footclient.desktop:2"
        # 3
        "nixos-manual.desktop:3"
        "org.qutebrowser.qutebrowser.desktop:3"
        # 4
        "org.gnome.Evince.desktop:4"
        "org.gnome.Nautilus.desktop:4"
        # 6
        "org.gnome.Dictionary.desktop:6"
        "org.gnome.DiskUtility.desktop:6"
        "gparted.desktop:6"
        # 7
        "calibre-gui.desktop:7"
        "calibre-ebook-edit.desktop:7"
        "calibre-ebook-viewer.desktop:7"
        "org.keepassxc.KeePassXC.desktop:7"
        # 8
        "ferdium.desktop:8"
        "librewolf.desktop:8"
        # 9
        "mpv.desktop:9"
        "umpv.desktop:9"
        ];
    };
    "org/gnome/shell/extensions/caffeine" = {
      toggle-shortcut = [ "<Super>F12" ];
      screen-blank = "always";
      show-indicator = "always";
      indicator-position = "0";
      indicator-position-index = "0";
      trigger-apps-mode = "on-focus";
      # inhibit-apps = [ "umpv.desktop" "mpv.desktop" ];
    };
    "org/gnome/shell/extensions/clipboard-indicator" = {
      refresh-interval = 5000;
      display-mode = 2;
      strip-text = true;
      move-item-first = true;
      toggle-menu = [ "<Super>Insert" ];
      topbar-preview-size = 15;
      prev-entry = [ "<Super>Page_Down" ];
      next-entry = [ "<Super>Page_Up" ];
      clear-history = [ "<Super>Delete" ];
    };
    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-app-switch = false;
      animate-window-launch = false;
      appicon-margin = 0;
      appicon-padding = 0;
      dot-position = "BOTTOM";
      dot-style-focused = "METRO";
      dot-style-unfocused = "DASHES";
      group-apps = true;
      hide-overview-on-startup = true;
      hot-keys = false;
      intellihide = false;
      intellihide-key-toggle = [ "<Super>b" ];
      isolate-monitors = true;
      isolate-workspaces = false;
      leftbox-size = 0;
      overview-click-to-exit = false;
      panel-element-positions = "{\"0\":[
        {\"element\":\"showAppsButton\", \"visible\":false,\"position\":\"stackedTL\"},
        {\"element\":\"activitiesButton\",\"visible\":false,\"position\":\"stackedTL\"},
        {\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedTL\"},
        {\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},
        {\"element\":\"centerBox\",\"visible\":true,\"position\":\"stackedBR\"},
        {\"element\":\"rightBox\",\"visible\":true,\"position\":\"stackedBR\"},
        {\"element\":\"dateMenu\",\"visible\":true,\"position\":\"stackedBR\"},
        {\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"},
        {\"element\":\"desktopButton\",\"visible\":false,\"position\":\"stackedBR\"}
        ]}";
        # ] \"1\":[
        # {\"element\":\"showAppsButton\",\"visible\":false,\"position\":\"stackedTL\"},
        # {\"element\":\"activitiesButton\",\"visible\":false,\"position\":\"stackedTL\"},
        # {\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedTL\"},
        # {\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},
        # {\"element\":\"centerBox\",\"visible\":true,\"position\":\"stackedBR\"},
        # {\"element\":\"rightBox\",\"visible\":true,\"position\":\"stackedBR\"},
        # {\"element\":\"dateMenu\",\"visible\":true,\"position\":\"stackedBR\"},
        # {\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"},
        # {\"element\":\"desktopButton\",\"visible\":true,\"position\":\"stackedBR\"}
        # ]}";
      panel-lengths = "{\"0\":100,\"1\":100}";
      panel-positions = "{\"0\":\"TOP\",\"1\":\"TOP\"}";
      panel-sizes = "{\"0\":24,\"1\":24,\"24\":24}";
      progress-show-count = true;
      show-appmenu = false;
      show-favorites = true;
      show-running-apps = true;
      show-tooltip = false;
      show-window-previews = false;
      stockgs-force-hotcorner = false;
      stockgs-keep-dash = false;
      stockgs-keep-top-panel = false;
      stockgs-panelbtn-click-only = false;
      trans-use-custom-bg = false;
      tray-size = 0;
    };

    # "org/gnome/nautilus/window-state/maximized" = false;
# /org/gnome/desktop/notifications/application-children
  # ['org-gnome-nautilus', 'alacritty', 'org-qutebrowser-qutebrowser', 'librewolf', 'org-gnome-extensions', 'org-keepassxc-keepassxc', 'mpv', 'gnome-network-panel', 'emacsclient', 'org-gnome-settings', 'org-gnome-evince', 'emacs', 'org-gnome-shell-extensions']

    "org/gnome/shell/extensions/forge" = {
      tabbed-tiling-mode-enabled = true;
      workspace-skip-tile = "";
    };
    "org/gnome/shell/extensions/forge/keybindings" = {
      window-focus-down = [ "<Super>j" ];
      window-focus-left = [ "<Super>h" ];
      window-focus-right = [ "<Super>l" ];
      window-focus-up = [ "<Super>k" ];
      window-move-down = [ "<Shift><Super>j" ];
      window-move-left = [ "<Shift><Super>h" ];
      window-move-right = [ "<Shift><Super>l" ];
      window-move-up = [ "<Shift><Super>k" ];
      window-resize-bottom-decrease = [ "<Super>u" ];
      window-resize-left-decrease = [ "<Super>y" ];
      window-resize-right-decrease = [ "<Super>p" ];
      window-resize-up-decrease = [ "<Super>o" ];
      window-resize-bottom-increase = [ "<Shift><Super>u" ];
      window-resize-left-increase = [ "<Shift><Super>y" ];
      window-resize-right-increase = [ "<Shift><Super>p" ];
      window-resize-up-increase = [ "<Shift><Super>o" ];
      window-snap-center = [ "<Ctrl><Super>n" ];
      window-swap-last-active = [ "<Super>Return" ];
      con-split-horizontal = [ "<Super>z" ];
      con-split-vertical = [ "<Super>x" ];
      con-split-layout-toggle = [ "<Super>c" ];
      con-stacked-layout-toggle = [ "<Shift><Super>s" ];
      con-tabbed-layout-toggle = [ "<Shift><Super>t" ];
      con-tabbed-showtab-decoration-toggle = [ "<Ctrl><Super>t" ];
      focus-border-toggle = [ "<Super>x" ];
      prefs-open = [ ];
    };
    "org/gnome/shell/extensions/forge/window-gap-size-increment" = {
      window-gap-size-increment = 0;
      window-gap-hidden-on-single = true;
    };
    "org/gnome/shell/extensions/just-perfection/background-menu" = {
      background-menu = false;
      ripple-box = false;
      workspaces-in-app-grid = false;
      window-preview-caption = true;
      window-preview-close-button = true;
      workspace = true;
      workspace-popup = false;
      osd = true;
      show-apps-button = false;
      dash-separator = false;
      dash = false;
      search = false;
      weather = false;
      calendar = true;
      world-clock = false;
      accessibility-menu = false;
      keyboard-layout = false;
      clock-menu = true;
      app-menu = true;
      app-menu-label = true;
      quick-settings = true;
      screen-sharing-indicator = true;
      window-menu-take-screenshot-button = true;
      app-menu-icon = true;
      panel-notification-icon = true;
      power-icon = true;
      window-picker-icon = true;
      window-demands-attention-focus = false;
      double-super-to-appgrid = false;
      startup-status = 0;
      clock-menu-position = 0;
      notification-banner-position = 1;
      alt-tab-icon-size = 0;
      alt-tab-small-icon-size = 0;
      alt-tab-window-preview-size = 0;
    };
    "org/gnome/shell/extensions/space-bar/shortcuts" = {
      activate-empty-key = [ "<Super>e" ];
      activate-previous-key = [ "<Super>semicolon" ];
      enable-activate-workspace-shortcuts = true;
      enable-move-to-workspace-shortcuts = true;
    };
    "org/gnome/shell/extensions/space-bar/shortcuts/appearance" = {
      active-workspace-border-radius = 10;
      active-workspace-border-width = 0;
      active-workspace-padding-h = 8;
      active-workspace-padding-v = 3;
      empty-workspace-border-radius = 10;
      empty-workspace-border-width = 0;
      empty-workspace-padding-h = 8;
      empty-workspace-padding-v = 3;
      inactive-workspace-border-radius = 10;
      inactive-workspace-border-width = 0;
      inactive-workspace-padding-h = 8;
      inactive-workspace-padding-v = 3;
      workspace-margin = 4;
      workspaces-bar-padding = 10;
    };
    "org/gnome/shell/extensions/space-bar/shortcuts/behavior" = {
      position-index = 0;
      position = "left";
      show-empty-workspaces = false;
      smart-workspace-names = false;
    };

    "org/gnome/shell/extensions/vitals" = {
      update-time = 10;
      position-in-panel = 2;
      alphabetize = false;
      hide-zeros = true;
      fixed-widths = false;
      hide-icons = true;
      hot-sensors = [
        "_system_load_1m_"
        "_system_load_5m_"
        "_system_load_15m_"
        "_system_threads_active_"
        "_processor_usage_"
        "_processor_frequency_"
        "_temperature_processor_0_'"
        "_memory_usage_"
        "_memory_swap_"
        # "_memory_allocated_"
        # "_memory_cached_"
        # "_memory_free_"
        "__network-rx_max__"
        "__network-tx_max__"
        # "__network-rx_ses__"
        # "__network-tx_ses__"
      ];
      show-temperature = true;
      network-speed-format = 1;
      show-network = true;
      show-system = true;
      show-processor = true;
      show-memory = true;
      show-fan = false;
      show-voltage = false;
      show-battery = false;
      show-storage = false;
    };
    "org/gnome/shell/keybindings" = {
      focus-active-notification = [ ];
      show-screen-recording-ui = ["<Super>Print"];
      toggle-message-tray = [ ];
      toggle-overview = [ ];
    };

    "org/gnome/desktop/screensaver" = {
      # color-shading-type = "solid";
      # embedded-keyboard-command = "";
      # embedded-keyboard-enabled = false;
      # idle-activation-enabled = true;
      lock-delay = 60;
      lock-enabled = true;
      logout-delay = 7200;
      logout-enabled = false;
      picture-opacity = 100;
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.webp";
      primary-color = "#3071AE";
      secondary-color = "#000000";
      show-full-name-in-top-bar = true;
      status-message-enabled = true;
      user-switch-enabled = true;
    };

    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = false;
      focus-change-on-pointer-rest = false;
      overlay-key = "Super_L";
      workspaces-only-on-primary = true;
    };
    "org/gnome/mutter/keybindings" = {
      toggle-tiled-right = [ ];
      toggle-tiled-left = [ ];
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = true;
      power-button-action = "interactive";
      powersleep-inactive-ac-type = "suspend";
      sleep-inactive-ac-timeout = 3600;
      sleep-inactive-ac-type = "nothing";
    };
    "org/gnome/settings-daemon/power" = {
      ambient-enabled = true;
      idle-brightness = 30;
      idle-dim = true;
      power-button-action = "interactive";
      power-saver-profile-on-low-battery = true;
      sleep-inactive-ac-timeout = 900;
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-battery-timeout = 900;
      sleep-inactive-battery-type = "suspend";
    };
    # "org/gnome/settings-daemon/plugins/media-keys" = {
    #   control-center = [ ];
    #   decrease-text-size = [ ];
    #   email = [ ];
    #   increase-text-size = [ ];
    #   logout = [ "<Control><Super>q" ];
    #   magnifier = [ ];
    #   magnifier-zoom-in = [ ];
    #   magnifier-zoom-out = [ ];
    #   mic-mute = [ "<Super>Pause" ];
    #   next = [ "<Super>End" ];
    #   on-screen-keyboard = [ ];
    #   play = [ "Pause" ];
    #   previous = [ "<Super>Home" ];
    #   screenreader = [ ];
    #   search = [ ];
    #   stop = [ ];
    #   toggle-contrast = [ ];
    #   volume-down = [ "<Super>KP_Subtract" ];
    #   volume-step = 5;
    #   volume-up = [ "<Super>KP_Add" ];
    #   www = [ ];
    # };
    # "org/gnome/settings-daemon/plugins/media-keys" = {
    #   custom-keybindings = [
    #     "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0"
    #     "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1"
    #     "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2"
    #   ];
    # };
    # "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
    #   name = "tppclt toggle";
    #   command = "sh /home/davide/.local/bin/media/tppctl toggle";
    #   binding = "<Super>period";
    # };
    # "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
    #   name = "tppctl invert";
    #   command = "sh /home/davide/.local/bin/media/tppctl invert";
    #   binding = "<Shift><Super>period";
    # };

    "org/gnome/system/location" = { enabled = false; };

    # "org/gnome/desktop/session/idle-delay" = "uint32 180";
    "org/gnome/desktop/search-providers" = {
      disabled = [ "org.gnome.clocks.desktop" ];
      disable-external = false;
    };
    "org/gnome/desktop/input-sources" = {
      color-scheme = "prefer-dark";
      per-window = false;
      show-all-sources = true;
    };
    "org/gnome/desktop/interface" = {
      enable-hot-corners = false;
      clock-show-date = true;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      enable-animations = false;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
      two-finger-scrolling-enabled = false;
    };
    "org/gnome/desktop/wm/keybindings" = {
        # cycle-windows = [ "<Super>Tab" ];
        # move-to-workspace-last = [ "<Shift><Super>semicolon" ];
        # switch-to-workspace-last = [ "<Super>semicolon" ];
        # switch-windows = [ "<Super>Tab" ];
        # switch-windows-backward = [ "<Shift><Super>Tab" ];
        begin-move = ["<Control><Super>e"];
        begin-resize = ["<Shift><Super>r"];
        close = [ "<Super>q" ];
        cycle-group = [ ];
        cycle-group-backward = [ ];
        cycle-panels = [ ];
        cycle-panels-backward = [ ];
        # cycle-windows = ["<Super>grave"];
        cycle-windows = [ ];
        # cycle-windows-backward = ["<Shift><Super>grave"];
        cycle-windows-backward = [ ];
        focus-active-notification = [ ];
        lower = [ ];
        minimize = [ ];
        move-to-monitor-left = [ "<Control><Super>h" ];
        move-to-monitor-right = [ "<Control><Super>l" ];
        move-to-monitor-up = [ ];
        move-to-workspace-1 = [ "<Shift><Super>1" ];
        move-to-workspace-2 = [ "<Shift><Super>2" ];
        move-to-workspace-3 = [ "<Shift><Super>3" ];
        move-to-workspace-4 = [ "<Shift><Super>4" ];
        move-to-workspace-5 = [ "<Shift><Super>5" ];
        move-to-workspace-6 = [ "<Shift><Super>6" ];
        move-to-workspace-7 = [ "<Shift><Super>7" ];
        move-to-workspace-8 = [ "<Shift><Super>8" ];
        move-to-workspace-9 = [ "<Shift><Super>9" ];
        move-to-workspace-last = [ ];
        move-to-workspace-left = [ ];
        move-to-workspace-right = [ ];
        panel-run-dialog = [ "<Super>d" ];
        switch-applications = [ "<Super>Tab" ];
        switch-applications-backward = [ "<Shift><Super>Tab" ];
        switch-group = [ "<Super>grave" ];
        switch-group-backward = [ "<Shift><Super>grave" ];
        switch-input-source = [ ];
        switch-input-source-backward = [ ];
        switch-panels = [ ];
        switch-panels-backward = [ ];
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        switch-to-workspace-5 = [ "<Super>5" ];
        switch-to-workspace-6 = [ "<Super>6" ];
        switch-to-workspace-7 = [ "<Super>7" ];
        switch-to-workspace-8 = [ "<Super>8" ];
        switch-to-workspace-9 = [ "<Super>9" ];
        switch-to-workspace-last = [ ];
        switch-to-workspace-left = [ "<Super>bracketleft" ];
        switch-to-workspace-right = [ "<Super>bracketright" ];
        toggle-fullscreen = [ "<Super><Shift>f" ];
        toggle-maximized = [ "<Super>f" ];
        toggle-message-tray = [ ];
        toggle-on-all-workspaces = [ "<Super>s" ];
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      audible-bell = false;
      auto-raise = true;
      focus-mode = "click";
      num-workspaces = 9;
    };

    # "org/gnome/desktop/wm/preferences.workspace-names" =
    #   [ "w1" "w2" "w3" "w4" "w5" "w6" "w7" "w8" "w9" ];
  };
}
