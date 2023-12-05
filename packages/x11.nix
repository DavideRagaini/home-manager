{ config, pkgs, ... }:

{  home = {
    packages = with pkgs; [
      conky
      djvulibre
      fontpreview
      ghostscript
      gnome-epub-thumbnailer
      maim
      numlockx
      # wkhtmltopdf
      wmctrl
      xautolock
      xcape
      xclip
      xdotool
      xorg.xmodmap
    ];
  };
}
