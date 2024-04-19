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
      lm_sensors
      lshw
      mediainfo
      mpc-cli
      mpd
      ncdu
      ncmpcpp
      pciutils
      pipx
      rsync
      sioyek
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
}
