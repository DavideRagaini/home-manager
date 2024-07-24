{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      btop
      calibre
      catppuccin-cursors.macchiatoDark
      dmenu
      duf
      djvulibre
      ffmpegthumbnailer
      gnome-epub-thumbnailer
      dunst
      fd
      ffmpeg
      gcc9
      gnupg
      hdparm
      html2text
      htop
      jmtpfs
      keepassxc
      libnotify
      lsof
      mpv
      neovim
      papirus-icon-theme
      poppler_utils
      powertop
      pulsemixer
      tealdeer
      trash-cli
      tmux
      yt-dlp
    ];
  };
}
