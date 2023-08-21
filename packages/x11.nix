{ config, pkgs, ... }:

{  home = {
    packages = with pkgs; [
      conky
      rofi
      rofimoji
      xcape
      xclip
      xdotool
      xorg.xmodmap
    ];
  };
}
