{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # brave
      catppuccin-cursors.macchiatoDark
      dmenu
      fd
      ffmpeg
      gcc9
      gnupg
      hdparm
      html2text
      htop
      jmtpfs
      keepassxc
      kodi
      libnotify
      # librewolf
      libsForQt5.breeze-qt5
      lsof
      mpv
      neovim
      papirus-icon-theme
      poppler_utils
      powertop
      pulsemixer
      # qutebrowser
      qt5ct
      tealdeer
      trash-cli
      tmux
      yaru-theme
      yt-dlp
    ];
  };
}
