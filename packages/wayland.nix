{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      emacs29-pgtk
      cliphist
      sway-contrib.grimshot
      imv
      tofi
      wl-clipboard
      wlsunset
      libsixel
      lsix
      chafa
      foot
      wlr-randr
      swayidle
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
