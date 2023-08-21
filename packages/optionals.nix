{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # Readability script
      # activity-watch
      # aw-watcher-afk
      # aw-watcher-windows
      # nodePackages.readability-cli
      # python311Packages.readability-lxml
      # python311Packages.requests
      # teams-for-linux
      # tikzit
      ferdium
      streamlink
      texlive.combined.scheme-full
    ];
  };
}
