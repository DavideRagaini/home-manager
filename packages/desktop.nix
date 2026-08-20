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
      gpg-tui
      hdparm
      html2text
      htop
      jellyfin-mpv-shim
      jellyfin-tui
      jftui
      keepassxc
      libnotify
      lsof
      mpv
      neovim
      opencode
      pinentry-all
      poppler-utils
      powertop
      pulsemixer
      pwvucontrol
      qutebrowser
      rustnet
      tealdeer
      tmux
      trash-cli
      wiremix
      yt-dlp
    ];
  };
}
