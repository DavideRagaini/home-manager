{ pkgs, ... }:

# TODO Dividere in networking e hw tools

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
      openvpn
      openvpn3
      picocom
      remmina
      speedtest-go
      systemd-manager-tui
      tcpdump
      traceroute
      usbutils
      wireguard-tools
    ];
  };
}
