{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      brave
      catppuccin-cursors.macchiatoDark
      dmenu
      fd
      html2text
      jmtpfs
      keepassxc
      kodi
      libnotify
      librewolf
      libsForQt5.breeze-qt5
      mpv
      papirus-icon-theme
      poppler_utils
      pulsemixer
      qt5ct
      yaru-theme
    ];
  };
}
