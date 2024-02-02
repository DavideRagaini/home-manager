{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      emacs29-pgtk
      cliphist
      pqiv
      tofi
      wl-clipboard
    ];
    sessionVariables = {
      XDG_CURRENT_DESKTOP = "sway";
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };
}
