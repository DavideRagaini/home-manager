{ config, ... }:

{
  programs.gpg.enable = true;

  services = {
    clipmenu.enable = true;

    # ssh-agent = { enable = true; };

    gpg-agent = {
      enable = true;
      pinentryFlavor = "qt";
      enableSshSupport = true;
    };
  };
}
