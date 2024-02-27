{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      lua
      imagemagick
      ferdium
      parallel
      streamlink
      texlive.combined.scheme-full
    ];
  };
}
