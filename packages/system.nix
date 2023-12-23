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
      harfbuzz
      hw-probe
      jq
      lf
      librespot
      lm_sensors
      lshw
      mediainfo
      mpc-cli
      mpd
      ncdu
      ncmpcpp
      newsboat
      pciutils
      python311Packages.pip
      qbittorrent
      rsync
      socat
      # sox
      spotify-tui
      taskspooler
      tree
      tremc
      udisks
      unzip
      wcalc
      zathura
      zoxide
    ];
  };
}
