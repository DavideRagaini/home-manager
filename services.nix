{ config, lib, pkgs, ... }:

{
  services = {
    emacs = {
      enable = true;
      defaultEditor = true;
    };

    # ssh-agent = {
    #   enable = true;
    # };

    gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };

    clipmenu.enable = true;

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
}
