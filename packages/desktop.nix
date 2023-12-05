{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      ani-cli
      brave
      calibre
      catppuccin-cursors.macchiatoDark
      clipmenu
      dmenu
      easyeffects
      fd
      jmtpfs
      keepassxc
      kodi
      libnotify
      librewolf
      libsForQt5.breeze-qt5
      mangal
      mpv
      papirus-icon-theme
      pdftk
      pulsemixer
      qt5ct
      qutebrowser
      yaru-theme
    ];
  };
}
