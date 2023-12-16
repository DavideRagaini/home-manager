{ config, pkgs, ... }:

{  home = {
    packages = with pkgs; [
      conky
      djvulibre
      fontpreview
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
