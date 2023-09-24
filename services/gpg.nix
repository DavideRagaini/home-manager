{ config, pkgs, ... }:

{
  home = { packages = with pkgs; [ gnupg pinentry_qt ]; };

  programs.gpg.enable = true;

  services = {
    gpg-agent = {
      enable = true;
      pinentryFlavor = "qt";
      enableSshSupport = true;
    };
  };
}
