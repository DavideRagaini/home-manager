{ config, pkgs, ... }:

{
  # home = { packages = with pkgs; [ gnupg pinentry-qt ]; };

  programs.gpg.enable = true;

  services = {
    ssh-agent.enable = true;
    gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-qt;
      enableSshSupport = true;
    };
  };
}
