{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      ani-cli
      calibre
      clipmenu
      dmenu
      easyeffects
      ferdium
      keepassxc
      kodi
      libnotify
      librewolf
      mangal
      pdftk
      pipe-viewer
      pulsemixer
      qutebrowser-qt6
    ];
  };
}
