{ config, pkgs, ... }:

{
  xdg.enable = true;

  services = {
    mpd = {
      enable = true;
      musicDirectory = "${config.home.homeDirectory}/Storage/Music";
      extraConfig = ''
        restore_paused "yes"
        audio_output {
              type  "pipewire"
              name  "PipeWire Sound Server"
              # mixer_type "software"
        }
      '';
    };
    # ssh-agent = { enable = true; };
  };
}
