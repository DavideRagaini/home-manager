{ config, pkgs, ... }:

{  home = {
    packages = with pkgs; [
      # emacs-29pgtk
      evince
      pqiv
      tofi
      wl-clipboard
    ];
  };
}
