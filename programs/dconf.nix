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
    gnomeExtensions.caffeine
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.forge
    gnomeExtensions.just-perfection
    gnomeExtensions.space-bar
    gnomeExtensions.vitals
    # gnomeExtensions.cpufreq
    # gnomeExtensions.dash-to-panel
    # gnomeExtensions.sound-output-device-chooser
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
        "caffeine@patapon.info"
        "clipboard-indicator@tudmotu.com"
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "forge@jmmaranan.com"
        "just-perfection-desktop@just-perfection"
        "space-bar@luchrioh"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        # "user-theme@gnome-shell-extensions.gcampax.github.com"
        # "trayIconsReloaded@selfmade.pl"
        # "Vitals@CoreCoding.com"
        # "dash-to-panel@jderose9.github.com"
        # "sound-output-device-chooser@kgshank.net"
        # "space-bar@luchrioh"
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
      alphabetize = true;
      hide-zeros = true;
      fixed-widths = true;
      hide-icons = false;
      hot-sensors = [
        "_system_load_1m_"
        # "_system_load_5m_"
        # "_system_load_15m_"
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

    "org.gnome.desktop.screensaver" = {
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

    screensaver = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.webp";
      primary-color = "#3071AE";
    };
    # "org/gnome/nautilus/window-state/maximized" = false;

    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = false;
      focus-change-on-pointer-rest = false;
      overlay-key = "Super_L";
      workspaces-only-on-primary = true;
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
# org.gnome.settings-daemon.plugins.media-keys custom-keybindings ['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']
    "org.gnome.settings-daemon.plugins.media-keys" = {
      play = [ "Cancel" ];
      previous = [ "Back" ];
      volume-down = [ "<Super>Down" ];
      volume-mute = [ "<Control><Super>Down" ];
      volume-step = 5;
      volume-up = [ "<Super>Up" ];
    };

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
      two-finger-scrolling-enabled = true;
    };
    "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Super>q" ];
        lower = [ "<Control><Super>j" ];
        move-to-monitor-left = [ "<Control><Super>h" ];
        move-to-monitor-right = [ "<Control><Super>l" ];
        move-to-workspace-1 = [ "<Shift><Super>1" ];
        move-to-workspace-2 = [ "<Shift><Super>2" ];
        move-to-workspace-3 = [ "<Shift><Super>3" ];
        move-to-workspace-4 = [ "<Shift><Super>4" ];
        move-to-workspace-5 = [ "<Shift><Super>5" ];
        move-to-workspace-6 = [ "<Shift><Super>6" ];
        move-to-workspace-7 = [ "<Shift><Super>7" ];
        move-to-workspace-8 = [ "<Shift><Super>8" ];
        move-to-workspace-9 = [ "<Shift><Super>9" ];
        # move-to-workspace-last = [ "<Shift><Super>semicolon" ];
        # cycle-windows = [ "<Super>Tab" ];
        panel-run-dialog = [ "<Super>d" ];
        switch-applications = [ "<Super>Tab" ];
        switch-applications-backward = [ "<Super>i" ];
        switch-group = [ "<Super>grave" ];
        switch-group-backward = [ "<Shift><Super>grave" ];
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        switch-to-workspace-5 = [ "<Super>5" ];
        switch-to-workspace-6 = [ "<Super>6" ];
        switch-to-workspace-7 = [ "<Super>7" ];
        switch-to-workspace-8 = [ "<Super>8" ];
        switch-to-workspace-9 = [ "<Super>9" ];
        # switch-to-workspace-last = [ "<Super>semicolon" ];
        switch-to-workspace-left = [ "<Super>bracketleft" ];
        switch-to-workspace-right = [ "<Super>bracketright" ];
        # switch-windows = [ "<Super>Tab" ];
        # switch-windows-backward = [ "<Shift><Super>Tab" ];
        toggle-fullscreen = [ "<Super><Shift>f" ];
        toggle-maximized = [ "<Super>f" ];
        toggle-on-all-workspaces = [ "<Super>s" ];
      };
    "org/gnome/desktop/wm/preferences" = {
      audible-bell = false;
      auto-raise = true;
      focus-mode = "click";
      num-workspaces = 9;
    };

    # "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings" = [
    #   "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0"
    #   "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1"
    #   "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2"
    # ];
    # "org/gnome/settings-daemon/plugins/media-keys/custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
    #   name = "tppctl toggle";
    #   command = "sh /home/davide/.local/bin/media/tppctl toggle";
    #   binding = "<Super>period";
    # };
    # "org/gnome/settings-daemon/plugins/media-keys/custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
    #   name = "tppctl invert";
    #   command = "sh /home/davide/.local/bin/media/tppctl invert";
    #   binding = "<Shift><Super>period";
    # };

    # "org/gnome/desktop/wm/preferences.workspace-names" =
    #   [ "w1" "w2" "w3" "w4" "w5" "w6" "w7" "w8" "w9" ];
  };
}
