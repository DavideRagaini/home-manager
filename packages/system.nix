{ config, pkgs, ... }:

{  home = {
    packages = with pkgs; [
      atool
      bat
      cairo
      dash
      exa
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
