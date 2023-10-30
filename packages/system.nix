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
      mpc-cli
      mpd
      ncdu
      ncmpcpp
      newsboat
      # parallel
      pciutils
      python311Packages.pip
      qbittorrent
      rsync
      socat
      sox
      spotify-tui
      taskspooler
      transmission
      tree
      tremc
      unzip
      wcalc
      wmctrl
      zathura
      zoxide
    ];
  };
}
