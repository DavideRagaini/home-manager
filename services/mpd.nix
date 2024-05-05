{ config, pkgs, ... }:

{
  xdg.enable = true;

  services = {
    mpd = {
      enable = true;
      musicDirectory = "${config.home.homeDirectory}/mus";
      network = {
        startWhenNeeded = true;
      };
      extraConfig = ''
        auto_update "yes"
        restore_paused "yes"
        audio_output {
              type  "pipewire"
              name  "PipeWire Sound Server"
        }
      '';
    };
    # ssh-agent = { enable = true; };
  };
}
