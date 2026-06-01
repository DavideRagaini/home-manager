{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
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
      pinentry-all
      poppler-utils
      powertop
      pulsemixer
      pwvucontrol
      qutebrowser
      tealdeer
      tmux
      trash-cli
      wiremix
      yt-dlp
    ];
  };
}
