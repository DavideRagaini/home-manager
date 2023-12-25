{ config, pkgs, ... }:

{  home = {
    packages = with pkgs; [
      ani-cli
      calibre
      clipmenu
      djvulibre
      ffmpegthumbnailer
      gnome-epub-thumbnailer
      mangal
      pdftk
      ueberzugpp

      alsa-utils
      conky
      dunst
      emacs29
      fontpreview
      maim
      nsxiv
      numlockx
      wmctrl
      xautolock
      xcape
      xclip
      xdotool
      xorg.xmodmap
      xorg.xset
      xwallpaper
    ];
  };
}
