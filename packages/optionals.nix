{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      ferdium
      imagemagick
      lua
      nsxiv
      parallel
      texlive.combined.scheme-full
      wlopm
    ];
  };
}
