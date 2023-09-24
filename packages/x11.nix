{ config, pkgs, ... }:

{  home = {
    packages = with pkgs; [
      conky
      maim
      xcape
      xclip
      xdotool
      xorg.xmodmap
    ];
  };
}
