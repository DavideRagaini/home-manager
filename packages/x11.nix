{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [

      mypy
      iftop
      python311Packages.urllib3

      alacritty
      aria
      beets
      clipmenu
      pdftk
      ueberzugpp
      alsa-utils
      conky
      fontpreview
      maim
      nsxiv
      numlockx
      syncthingtray
      wmctrl
      xautolock
      xcape
      xclip
      xdotool
      xorg.xmodmap
      xorg.xset
    ];
  };
}
