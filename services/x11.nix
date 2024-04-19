{ config, pkgs, lib, ... }:

{
  services = {

    # clipmenu.enable = true;

    picom = {
      enable = false;
      activeOpacity = 1;
      inactiveOpacity = 0.95;
      menuOpacity = 0.95;
      opacityRules = [
        "100:class_g = sun-awt-X11-XFramePeer"
        "100:class_g = MATLAB R2023b - academic use"
        "100:class_g = Matlab-GLEE"
        "100:class_g = MATLAB R2023b Update 3"

        "100:class_g = mpv && focused"
        "100:class_g = mpv && IS_FLOATING_WINDOW@:s = 'False' && !focused"
        "10:class_g = mpv && IS_FLOATING_WINDOW@:s = 'True' && !focused"
        "95:class_g = 'URxvt' && !_NET_WM_STATE@:32a"

        "100:_NET_WM_STATE@[0]:32a = '_NET_WM_STATE_FULLSCREEN'"
        "100:_NET_WM_STATE@[1]:32a = '_NET_WM_STATE_FULLSCREEN'"
        "100:_NET_WM_STATE@[2]:32a = '_NET_WM_STATE_FULLSCREEN'"
        "100:_NET_WM_STATE@[3]:32a = '_NET_WM_STATE_FULLSCREEN'"
        "100:_NET_WM_STATE@[4]:32a = '_NET_WM_STATE_FULLSCREEN'"
        "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
        "0:_NET_WM_STATE@[0]:32a *= '_NET_WM_STATE_HIDDEN'"
        "0:_NET_WM_STATE@[1]:32a *= '_NET_WM_STATE_HIDDEN'"
        "0:_NET_WM_STATE@[2]:32a *= '_NET_WM_STATE_HIDDEN'"
        "0:_NET_WM_STATE@[3]:32a *= '_NET_WM_STATE_HIDDEN'"
        "0:_NET_WM_STATE@[4]:32a *= '_NET_WM_STATE_HIDDEN'"
      ];
      # settings = {};
      shadow = false;
      vSync = false;
      backend = "xrender"; # try "glx" if xrender doesn't help
      fade = false;
      fadeDelta = 1;
      fadeSteps = [ 0.01 0.01 ];
    };

    unclutter = {
      enable = true;
      threshold = 10;
      extraOptions = [ "exclude-root" "ignore-scrolling" ];
    };

    redshift = {
      enable = true;
      tray = false;
      dawnTime = "6:00";
      duskTime = "18:00";
      temperature = {
        day = 6500;
        night = 2400;
      };
      settings = {
        redshift = {
          adjustment-method = "randr";
          brightness-day = 1;
          brightness-night = 0.75;
        };
        randr = { screen = 0; };
      };
    };

    # screen-locker = {
    #   enable = true;
    #   inactiveInterval = 5;
    #   lockCmd = "${pkgs.i3lock} -eft -c 1d2021 -i ~/Storage/Pictures/lockscreen.png";
    #   xautolock = {
    #     enable = true;
    #     detectSleep = true;
    #     extraOptions = [
    #       "-notify 45"
    #       "-notifier 'notify-send -u critical -t 45000 'System will be locked' '45 seconds left''"
    #       "-locker 'systemctl suspend'"
    #     ];
    #   };
    # };

  };

  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };
}
