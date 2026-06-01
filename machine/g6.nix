{ lib, pkgs, ... }:

{

  # imports = [
  #   ./packages/work.nix
  # ];

  # home = {
  #   packages = with pkgs; [
  #     # remmina
  #     anydesk
  #     brave
  #     brightnessctl
  #     dig
  #     ferdium
  #     freerdp
  #     iproute2
  #     kanshi
  #     libreoffice-qt
  #     lm_sensors
  #     minicom
  #     obs-studio
  #     openfortivpn
  #     tcpdump
  #     thunderbird
  #     traceroute
  #     winbox4
  #     wireguard-tools
  #     wireshark
  #     yazi
  #   ];
  # };

  # services.espanso = {
  #   enable = true;
  #   package = pkgs.espanso-wayland;
  # };

  # systemd.user.services.espanso = {
  #   capabilities = [ "cap_dac_override=<whatever>" ];
  # };

  # home.pointerCursor = {
  #   gtk.enable = true;
  #   package = pkgs.vanilla-dmz;
  #   name = "Vanilla-DMZ";
  # };

}
