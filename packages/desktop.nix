{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      ani-cli
      calibre
      clipmenu
      dmenu
      easyeffects
      fd
      keepassxc
      kodi
      libnotify
      librewolf
      mangal
      pdftk
      qt5ct
      libsForQt5.breeze-qt5
      pulsemixer
      qutebrowser
      papirus-icon-theme
      yaru-theme
      catppuccin-cursors.macchiatoDark
    ];
  };
}
