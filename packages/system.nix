{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      atool
      bat
      cairo
      dash
      eza
      file
      fzf
      git-crypt
      # harfbuzz
      # hw-probe
      jq
      lf
      # lm_sensors
      # lshw
      mediainfo
      mpc-cli
      mpd
      ncdu
      ncmpcpp
      pciutils
      # pipx
      rsync
      # sioyek
      socat
      spotify-player
      taskspooler
      tree
      udisks
      unzip
      w3m
      wcalc
      zathura
      zip
      zoxide
    ];
  };

  programs = {
    spotify-player = {
      enable = true;
      settings = {
        theme = "dracula";
        client_port = 9080;
        playback_format = " \n      {track} • {artists}\n      {album}\n      {metadata} ";
        tracks_playback_limit = 50;
        app_refresh_duration_in_ms = 32;
        playback_refresh_duration_in_ms = 0;
        page_size_in_rows = 20;
        play_icon = "▶";
        pause_icon = "▌▌";
        liked_icon = "♥";
        border_type = "Plain";
        progress_bar_type = "Rectangle";
        playback_window_position = "Top";
        cover_img_length = 10;
        cover_img_width = 5;
        cover_img_scale = 1.0;
        playback_window_width = 6;
        enable_media_control = true;
        enable_streaming = "Always";
        enable_notify = false;
        enable_cover_image_cache = true;
        default_device = "spotify-player";
        notify_streaming_only = false;

        copy_command = { command = "cclip"; };

        notify_format = {
          summary = "{track} • {artists}";
          body = "{album}";
        };

        device = {
          name = "spotify-player";
          device_type = "computer";
          volume = 85;
          bitrate = 320;
          audio_cache = true;
          normalization = true;
        };
      };
      # keymaps = { };
      # themes = {};
    };

    bemenu = {
      enable = true;
      settings = {
        fb = "#24273a";
        ff = "#c6d0f5";
        nb = "#24273a";
        nf = "#c6d0f5";
        tb = "#24273a";
        hb = "#24273a";
        tf = "#e78284";
        hf = "#e78284";
        af = "#c6d0f5";
        ab = "#24273a";
        bdr = "#ffffff";
        cf = "#e78284";
        scf = "#e78284";
        scb = "#24273a";
        fn = "Fantasque Sans Mono bold 12";
        ignorecase = true;
        no-overlap = true;
        wrap = true;
        scrollbar = "autohide";
        width-factor = 0.9;
        fork = true;
        ifne = true;
        no-spacing = true;
        prefix = "»";
        prompt = " ~~~~~~ Select ~~~~~~ ";
        hp = 10;
        monitor = "-1";
      };
    };

  };
}
