{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      bemenu
      chafa
      cliphist
      emacs30-pgtk
      foot
      imv
      libsixel
      lsix
      sway-contrib.grimshot
      swayidle
      swaylock
      waybar
      wl-clipboard
      wlopm
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
      ];
    };
  };
}
