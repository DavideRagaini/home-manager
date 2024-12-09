{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      ferdium
      imagemagick
      lua
      luarocks
      nuclear
      parallel
      pipe-viewer
      openvpn3
      remmina
      texlive.combined.scheme-full
      wtwitch
    ];
  };
}
