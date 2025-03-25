{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      easyeffects
      ferdium
      imagemagick
      lua
      luarocks
      # nuclear
      parallel
      pipe-viewer
      openvpn3
      remmina
      texlive.combined.scheme-full
      wtwitch
    ];
  };
}
