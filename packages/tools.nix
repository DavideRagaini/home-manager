{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      ansible
      dig
      ethtool
      gping
      iperf
      iproute2
      lm_sensors
      minicom
      mmtui
      net-snmp
      nmap
      openfortivpn
      picocom
      remmina
      systemd-manager-tui
      tcpdump
      traceroute
      usbutils
      wireguard-tools
      yazi
    ];
  };
}
