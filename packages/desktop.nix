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
      fd
      ffmpegthumbnailer
      gnome-epub-thumbnailer
      html2text
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
      poppler_utils
      pulsemixer
      qt5ct
      qutebrowser
      ueberzugpp
      yaru-theme
    ];
  };
}
