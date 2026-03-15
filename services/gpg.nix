{ pkgs, ... }:

{
  # home = { packages = with pkgs; [ gnupg pinentry-qt ]; };


  programs = {
    gpg.enable = true;
  };

  services = {
    gnome-keyring.enable = true;
    ssh-agent.enable = true;
    gpg-agent = {
      enable = true;
      # pinentry.package = pkgs.pinentry-qt;
      enableSshSupport = true;
    };
  };
}
