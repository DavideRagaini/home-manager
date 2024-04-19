{ config, pkgs, ... }:

{
  imports = [
    ./packages/desktop.nix
    ./packages/emacs.nix
    ./packages/firefox.nix
    ./packages/system.nix
    ./packages/theme.nix
    ./services/dunst.nix
    ./services/gpg.nix
    ./services/mimeapplist.nix
    ./services/udiskie.nix
    # Bagaro
    # ./packages/wayland.nix
    # Apollo
    ./packages/x11.nix
    ./services/x11.nix
    ./packages/optionals.nix
    ./services/emacs.nix
    ./services/mpd.nix
  ];

  # xdg.userDirs.enable = true;
  # home.sessionVariables = {
  #   SUDO_ASKPASS = "pkgs.rofi -dmenu -password";
  # };

  # nixpkgs.config.allowUnfree = true;

  home = {
    file = { };
    username = "davide";
    homeDirectory = "/home/davide";
    stateVersion = "23.05"; # Please read the comment before changing.
  };

  programs.home-manager.enable = true;
}

# The home.packages option allows you to install Nix packages into your
# environment.
# home.packages = [
# # Adds the 'hello' command to your environment. It prints a friendly
# # "Hello, world!" when run.
# pkgs.hello

# # It is sometimes useful to fine-tune packages, for example, by applying
# # overrides. You can do that directly here, just don't forget the
# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
# # fonts?
# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

# # You can also create simple shell scripts directly inside your
# # configuration. For example, this adds a command 'my-hello' to your
# # environment:
# (pkgs.writeShellScriptBin "my-hello" ''
#   echo "Hello, ${config.home.username}!"
# '')
# ];
