{ config, pkgs, ... }:

{
  services = {

    # clipmenu.enable = true;

    dunst = {
      enable = true;
      iconTheme.package = pkgs.papirus-icon-theme;
      iconTheme.name = "Papirus-Dark";
      iconTheme.size = "32x32";
      settings = {
        global = {
          monitor = 0;
          follow = "none";
          width = "(0, 1500)";
          origin = "top-right";
          geometry = "0x0-35+80";
          offset = "15x50";
          scale = 0;
          notification_limit = 0;
          indicate_hidden = "yes";
          transparency = 0;
          separator_height = 2;
          padding = 20;
          horizontal_padding = 20;
          text_icon_padding = 15;
          frame_width = 1;
          frame_color = "#8EC07C";
          separator_color = "auto";
          sort = "no";
          idle_threshold = 1;
          font = "Fantasque Sans Mono 12";
          line_height = 3;
          markup = "full";
          format = ''<b>%s</b>\n%b\n\n[%a]\n%p'';
          alignment = "left";
          vertical_alignment = "center";
          show_age_threshold = 10;
          ellipsize = "middle";
          ignore_newline = "no";
          stack_duplicates = true;
          hide_duplicate_count = false;
          show_indicators = "no";
          word_wrap = "yes";
          icon_position = "right";
          min_icon_size = 80;
          max_icon_size = 80;
          sticky_history = "yes";
          history_length = 15;
          # dmenu = "${pkgs.dmenu-rs}/bin/dmenu -p dunst:";
          # browser = "${pkgs.xdg-utils}/bin/xdg-open";
          always_run_script = true;
          title = "Dunst";
          class = "Dunst";
          ignore_dbusclose = false;
          force_xwayland = false;
          force_xinerama = false;
          mouse_left_click = "close_current";
          mouse_middle_click = "do_action, close_current";
          mouse_right_click = "close_all";
        };
        experimental = { per_monitor_dpi = false; };
        urgency_low = {
          background = "#282a36";
          foreground = "#6272a4";
          timeout = 10;
        };
        urgency_normal = {
          background = "#282a36";
          foreground = "#bd93f9";
          timeout = 10;
        };
        urgency_critical = {
          background = "#ff5555";
          foreground = "#f8f8f2";
          frame_color = "#ff5555";
          timeout = 0;
        };
      };
    };

    picom = {
      enable = true;
      activeOpacity = 1;
      inactiveOpacity = 0.95;
      menuOpacity = 0.95;
      opacityRules = [
        "100:class_g = 'alacritty' && focused"
        "100:class_g = 'mpv' && focused"
        "100:class_g = 'mpv' && IS_FLOATING_WINDOW@:s = 'False' && !focused"
        "25:class_g = 'mpv' && IS_FLOATING_WINDOW@:s = 'True' && !focused"
        "95:class_g = 'URxvt' && !_NET_WM_STATE@:32a"
        "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
        "0:_NET_WM_STATE@[0]:32a *= '_NET_WM_STATE_HIDDEN'"
        "0:_NET_WM_STATE@[1]:32a *= '_NET_WM_STATE_HIDDEN'"
        "0:_NET_WM_STATE@[2]:32a *= '_NET_WM_STATE_HIDDEN'"
        "0:_NET_WM_STATE@[3]:32a *= '_NET_WM_STATE_HIDDEN'"
        "0:_NET_WM_STATE@[4]:32a *= '_NET_WM_STATE_HIDDEN'"
        "95:I3_FLOATING_WINDOW@:c"
      ];
      # settings = {};
      shadow = false;
      vSync = true;
      backend = "glx";
      fade = true;
      fadeDelta = 1;
      fadeSteps = [ 0.01 0.01 ];
    };

    unclutter = {
      enable = true;
      threshold = 10;
      extraOptions = [ "exclude-root" "ignore-scrolling" ];
    };

    redshift = {
      enable = true;
      tray = false;
      dawnTime = "6:00-7:30";
      duskTime = "17:00-21:00";
      latitude = 43.84;
      longitude = 13.01;
      temperature = {
        day = 5500;
        night = 3700;
      };
      settings = {
        redshift = { adjustment-method = "randr"; };
        randr = { screen = 0; };
      };
    };

  #   screen-locker = {
  #     enable = true;
  #     inactiveInterval = 5;
  #     lockCmd = "suspend";
  #     xautolock = {
  #       enable = true;
  #       detectSleep = true;
  #       extraOptions = [
  #         "-time 5"
  #         "-notify 45"
  #         "-notifier 'notify-send -u critical -t 45000 \'System will be locked\' \'45 seconds left\''"
  #         "-locker 'systemctl suspend'"
  #       ];
  #     };
  #   };

  };

  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };
}
