{ pkgs, ... }:

{
  # home = { packages = with pkgs; [ gnupg pinentry-qt ]; };

  programs = {
    gpg.enable = true;
  };

  # security.pam.services = {
  #   # greetd.enableGnomeKeyring = true;
  #   # greetd-password.enableGnomeKeyring = true;
  #   login.enableGnomeKeyring = true;
  # };

  # services.dbus.packages = [
  #   pkgs.gnome-keyring
  #   pkgs.gcr
  # ];
  services = {
    gnome-keyring.enable = true;
    # ssh-agent.enable = true;
    gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-bemenu;
      enableSshSupport = true;
    };
  };
}
