{ config, ... }:

{
  services = {
    # picom.enable = true;

    unclutter = {
      enable = true;
      threshold = 10;
      extraOptions = [ "exclude-root" "ignore-scrolling" ];
    };

    screen-locker = {
      enable = true;
      inactiveInterval = 5;
      lockCmd = "\${pkgs.systemctl}/bin/systemctl suspend";
      # xautolock.enable = true;
      # extraOptions = [
      #   "-time 5"
      #   "-notify 45"
      #   "-notifier 'norify-send -u critical -t 45000 \'System will be locked\' \'45 seconds left\''"
      #   "-locker 'systemctl suspend'"
      # ];
    };
  };

  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };
}
