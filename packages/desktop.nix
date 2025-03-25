{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      aria2
      alacritty
      btop
      calibre
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
      qutebrowser
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
