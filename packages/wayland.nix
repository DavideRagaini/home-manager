{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      emacs29-pgtk
      cliphist
      pqiv
      tofi
      wl-clipboard
      wlsunset
      libsixel
      lsix
      chafa
    ];
    sessionVariables = {
      XDG_CURRENT_DESKTOP = "sway";
    };
  };

  xdg = {
    portal = {
      config.common.default = "*";
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };
}
