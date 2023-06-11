{ lib, pkgs, ... }:

with lib.hm.gvariant;

{
  gtk = {
    enable = true;

    # iconTheme = {
    #   name = "Papirus-Dark";
    #   package = pkgs.papirus-icon-theme;
    # };

    theme = {
      name = "yaru-theme";
      package = pkgs.yaru-theme;
    };

    # cursorTheme = {
    #   name = "Numix-Cursor";
    #   package = pkgs.numix-cursor-theme;
    # };

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
    gnomeExtensions.forge
    gnomeExtensions.just-perfection
    # gnomeExtensions.user-themes
    # gnomeExtensions.tray-icons-reloaded
    # gnomeExtensions.vitals
    # gnomeExtensions.dash-to-panel
    # gnomeExtensions.sound-output-device-chooser
    # gnomeExtensions.space-bar
  ];

  dconf.settings = {
    # "org/gnome/control-center/last-panel" = "background";
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        "caffeine@patapon.info"
        "forge@jmmaranan.com"
        "just-perfection-desktop@just-perfection"
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
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

    "org/gnome/shell/extensions/caffeine" = {
      toggle-shortcut = [ "<Super>F12" ];
      screen-blank = "always";
      show-indicator = "always";
      indicator-position = "0";
      indicator-position-index = "0";
      trigger-apps-mode = "on-focus";
      inhibit-apps = [ "umpv.desktop" "mpv.desktop" ];
    };

    # "org/gnome/nautilus/window-state/maximized" = false;

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      powersleep-inactive-ac-type = "suspend";
    };

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
      clock-show-date = false;
      clock-show-weekday = false;
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
        move-to-workspace-last = [ "<Shift><Super>semicolon" ];
        panel-run-dialog = [ "<Super>d" ];
        switch-applications = [ "<Super>o" ];
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
        switch-to-workspace-last = [ "<Super>semicolon" ];
        switch-to-workspace-left = [ "<Super>bracketleft" ];
        switch-to-workspace-right = [ "<Super>bracketright" ];
        switch-windows = [ "<Super>Tab" ];
        switch-windows-backward = [ "<Shift><Super>Tab" ];
        toggle-fullscreen = [ "<Super>f" ];
        toggle-on-all-workspaces = [ "<Super>s" ];
        # maximize = ['<Super>f'];
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

    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = false;
      focus-change-on-pointer-rest = false;
      overlay-key = "Super_L";
      workspaces-only-on-primary = true;
    };

    "org/gnome/settings-daemon/power" = {
      idle-dim = true;
      sleep-inactive-ac-timeout = 3600;
      sleep-inactive-ac-type = "nothing";
      # plugins.media-keys = {
      #   play = ["Cancel"]
      #   next = ["Forward"]
      #   previous = ["Back"]
      # };
    };

    "org/gnome/system/location" = { enabled = false; };
    "org/gnome/desktop/wm/preferences" = {
      audible-bell = false;
      auto-raise = true;
      focus-mode = "click";
    };
  };
}
