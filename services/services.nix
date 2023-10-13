{ config, pkgs, ... }:

{
  xdg.enable = true;

  services = {
    clipmenu.enable = true;

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
          format = ''<b>%s</b>\n%a %b\n\n[%a]\n%p'';
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
          dmenu = "${pkgs.dmenu-rs}/bin/dmenu -p dunst:";
          browser = "${pkgs.xdg-utils}/bin/xdg-open";
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

    mpd = {
      enable = true;
      musicDirectory = "${config.home.homeDirectory}/Storage/Music";
      extraConfig = ''
        auto_update "yes"
        restore_paused "yes"
        volume_normalization "yes"

        audio_output {
              type  "pipewire"
              name  "PipeWire Sound Server"
              # mixer_type "software"
        }
      '';
    };
    # ssh-agent = { enable = true; };
  };
}
