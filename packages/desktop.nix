{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      pcmanfm-qt
      aria2
      btop
      calibre
      djvulibre
      duf
      dunst
      fd
      ffmpeg
      ffmpegthumbnailer
      gcc
      gnome-epub-thumbnailer
      gnupg
      hdparm
      html2text
      htop
      jftui
      jmtpfs
      keepassxc
      libnotify
      lsof
      mpv
      neovim
      poppler-utils
      powertop
      pulsemixer
      qutebrowser
      tealdeer
      tmux
      trash-cli
      yt-dlp
    ];
  };
}
