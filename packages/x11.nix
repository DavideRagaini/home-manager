{ config, pkgs, ... }:

{  home = {
    packages = with pkgs; [
      conky
      maim
      xautolock
      xcape
      xclip
      xdotool
      xorg.xmodmap
    ];
  };
}
