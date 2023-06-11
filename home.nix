{ config, pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "emacsclient";
    BROWSER = "librewolf";
  };

  imports = [
    # ./programs/firefox.nix
    ./programs/dconf.nix
    # ./services.nix
  ];

  # let
  #   doom-emacs = pkgs.callPackage (builtins.fetchTarball {
  #     url = https://github.com/vlaci/nix-doom-emacs/archive/master.tar.gz;
  #   }) {
  #     doomPrivateDir = "$HOME/.config/doom";
  #   };
  # in {
  #   home.packages = [ doom-emacs ];
  #   home.file."$HOME/.config/emacs.d/init.el".text = ''
  #       (load "default.el")
  #   '';
  # };

  # # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbVariant = "altgr-intl";
  # services.xserver.xkbOptions = "eurosign:e,ctrl:swapcaps,altwin:swap_alt_win,altwin:escape,altwin:menu_win";

  # # Fonts
  # fonts.fonts = with pkgs; [
  #   nerdfonts
  #   liberation_ttf
  #   fantasque-sans-mono
  # ];

  # programs.dconf.enable = true;
  services.gpg-agent.enable = true;
  programs.ssh.enable = true;

  home.packages = with pkgs; [
    atool
    bat
    evince
    exa
    fd
    fzf
    gnome.gnome-clocks
    gnome.nautilus
    emacs29-pgtk
    transmission
    librewolf
    gparted
    hunspell
    jq
    keepassxc
    lf
    libnotify
    librespot
    librewolf
    lm_sensors
    mpd
    ncmpcpp
    newsboat
    nixfmt
    nodejs_20
    pipe-viewer
    pipenv
    pqiv
    pulsemixer
    python311
    python311Packages.black
    python311Packages.isort
    python311Packages.nose
    python311Packages.pyflakes
    python311Packages.pytest
    qutebrowser-qt6
    rhythmbox
    ripgrep
    rsync
    shellcheck
    shfmt
    socat
    sox
    spotify-tui
    tofi
    tree
    tridactyl-native
    unzip
    wmctrl
    xclip
    zoxide
  ];

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.displayManager.autoLogin.enable = true;
  # services.xserver.displayManager.autoLogin.user = "davide";
  # services.xserver.desktopManager.gnome.enable = true;

  # programs.waybar.enable = true;
  # programs.qt5ct.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "davide";
  home.homeDirectory = "/home/davide";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/davide/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
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
