{ config, pkgs, ... }:

{
  imports = [
    # ./packages/wayland.nix
    ./packages/desktop.nix
    ./packages/emacs.nix
    ./packages/optionals.nix
    ./packages/system.nix
    ./packages/x11.nix
    ./programs/theme.nix
    ./services/emacs.nix
    ./services/services.nix
    ./services/udiskie.nix
    ./services/x11.nix
  ];

  # xdg.userDirs.enable = true;
  # home.sessionVariables = {
  #   SUDO_ASKPASS = "pkgs.rofi -dmenu -password";
  # };

  home = {
    file = { };
    username = "davide";
    homeDirectory = "/home/davide";
    stateVersion = "23.05"; # Please read the comment before changing.
  };

  programs.home-manager.enable = true;

  manual.manpages.enable = false;
  manual.html.enable = false;
  manual.json.enable = false;
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
