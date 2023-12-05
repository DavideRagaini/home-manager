{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      beats
      imagemagick
      ferdium
      okular
      parallel
      streamlink
      texlive.combined.scheme-full
    ];
  };
}
