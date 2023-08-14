{ config, lib, pkgs, ... }:

{
  services = {
    emacs = {
      enable = true;
      defaultEditor = true;
    };

    clipmenu.enable = true;
    # picom.enable = true;

    # mpd = {
    #   enable = true;
    #   extraConfig = "";
    # };

    # ssh-agent = {
    #   enable = true;
    # };

    gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };

    unclutter = {
      enable = true;
      threshold = 10;
      extraOptions = [
        "exclude-root"
        "ignore-scrolling"
      ];
    };

    udiskie = {
      enable = true;
      automount = false;
      tray = "auto";
      settings = {
        program_options = {
          menu = "flat";
          automount = false;
          notify = true;
          password_cache = 30;
          file_manager = "/bin/alacritty -e lfub --working-directory";
          terminal = "/bin/alacritty --working-directory";
          password_prompt = [ "gnome-keyring-query" "get" "{id_uuid}" ];
        };
          # device_config = {
        # - id_uuid: 2542-5EA1
        #   ignore:      true
        # - id_uuid: d98c2c93-6eb7-4aac-9769-d44a677dd88b
        #   ignore:      true
        # - id_uuid: 05275cfd-e994-4712-b56c-31fb11299045
        #   ignore:      true
        # - id_uuid: c90288ef-87e9-452f-98fc-597d282d95db
        #   ignore:      true
        # - device_id: usb-Generic_MassStorageClass_000000002402-0:0
        #   ignore:      true
        # - is_systeminternal:
        #   ignore:      true
        # - device_file: /dev/loop*
        #   ignore:      true
        # - ignore:    False           # never mount/unmount or even show this in the GUI
        #   automount: False          # show but do not automount this device
        #   options: []               # additional options to be passed when mounting
        #   };
        notifications = {
          timeout = 1.5;
          device_mounted = 5;
          device_unmounted = false;
          device_added = false;
          device_removed = false;
          device_unlocked = "-1";
          device_locked = "-1";
          job_failed = "-1";
        };
        quickmenu_actions = [
          "mount"
          "unmount"
          "unlock"
          "terminal"
          "detach"
          "delete"
        ];
        notification_actions = {
          device_mounted = ["browse"];
          device_added = ["mount"];
        };
        icon_names = {
          media = [ "drive-removable-media" "media-optical"];
          browse = ["document-open" "folder-open"];
          terminal = ["terminal" "terminator" "xfce-terminal"];
          mount = ["udiskie-mount"];
          unmount = ["udiskie-unmount"];
          unlock = ["udiskie-unlock"];
          lock = ["udiskie-lock"];
          eject = ["udiskie-eject" "media-eject"];
          detach = ["udiskie-detach"];
          delete = ["udiskie-eject"];
          quit = ["application-exit"];
        };
      };
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

    # mpd = {
    #   enable = true;
      # extraConfig = "
      #   auto_update 'yes'
      #   restore_paused 'yes'
      #   volume_normalization 'yes'

      #   audio_output {
      #         type  'pipewire'
      #         name  'PipeWire Sound Server'
      #         # mixer_type 'software'
      #   }";
      # musicDirectory = "~/Storage/Music";
      # playlistDirectory = "";
      # dbFile = "";
      # dataDir = "";
    # };
  };
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };
}
