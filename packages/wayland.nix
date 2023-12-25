{ config, pkgs, ... }:

{  home = {
    packages = with pkgs; [
      emacs29-pgtk
      cliphist
      pqiv
      tofi
      wl-clipboard
    ];
  };
}
