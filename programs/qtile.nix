{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    windowManager = {
      qtile = {
        enable = true;
        backend = "wayland";
      };
    };

    windowManager.default = "none+qtile";
    };
}
