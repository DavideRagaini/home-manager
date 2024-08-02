{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      bemenu
      chafa
      cliphist
      emacs29-pgtk
      foot
      imv
      libsixel
      lsix
      sway-contrib.grimshot
      swayidle
      swaylock
      wl-clipboard
      wlr-randr
      wlsunset
    ];
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
