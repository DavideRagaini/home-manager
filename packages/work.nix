{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      anydesk
      brave
      ferdium
      googleearth-pro
      kanshi
      libreoffice-qt
      namespaced-openvpn
      networkmanagerapplet
      obs-studio
      openfortivpn
      thunderbird
      winbox4
    ];
  };

  # virtualisation.docker.enable = true;
  # users.users.davide.extraGroups = [ "docker" ];

  nixpkgs.config = {
    allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "anydesk"
        "winbox4"
        "winbox"
        "googleearth-pro"
      ];

    permittedInsecurePackages = [
      "googleearth-pro-7.3.7.1155"
    ];
  };

}
