{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      lua
      imagemagick
      ferdium
      parallel
      texlive.combined.scheme-full
    ];
  };
}
