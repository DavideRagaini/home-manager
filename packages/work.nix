{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      anydesk
      brave
      ferdium
      kanshi
      libreoffice-qt
      namespaced-openvpn
      networkmanagerapplet
      obs-studio
      thunderbird
      winbox4
    ];
  };

  # virtualisation.docker.enable = true;
  # users.users.davide.extraGroups = [ "docker" ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "anydesk"
      "winbox4"
      "winbox"
    ];
}
