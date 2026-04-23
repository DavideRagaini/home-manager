{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      dig
      ethtool
      freerdp
      gping
      iproute2
      lm_sensors
      minicom
      mmtui
      nmap
      net-snmp
      openfortivpn
      picocom
      remmina
      systemd-manager-tui
      tcpdump
      traceroute
      usbutils
      wireguard-tools
      wireshark
      wlvncc
      yazi
    ];
  };
}
