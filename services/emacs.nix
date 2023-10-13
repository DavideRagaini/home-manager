{ config, pkgs, ... }:

{
  services = {
    emacs = {
      enable = true;
      package = "${pkgs.emacs29}";
      defaultEditor = true;
    };
  };
}
