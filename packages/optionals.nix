{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      okular
      ferdium
      streamlink
      texlive.combined.scheme-full
    ];
  };
}
