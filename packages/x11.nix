{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      clipmenu
      fontpreview
      maim
      nsxiv
      numlockx
      ueberzugpp
      wmctrl
      xcape
      xclip
      xdotool
      xorg.xmodmap
      xorg.xset
    ];
  };
}
