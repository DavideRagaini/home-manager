{ config, pkgs, ... }:

{
  # xdg.userDirs.enable = true;

  home.packages = with pkgs; [
    # System utilities
    atool
    bat
    cairo
    dash
    exa
    file
    fzf
    gnupg
    harfbuzz
    # hblock
    jq
    lf
    librespot
    lm_sensors
    lshw
    mpc-cli
    mpd
    ncdu
    ncmpcpp
    newsboat
    pciutils
    rsync
    socat
    sox
    tremc
    spotify-tui
    sqlite
    transmission
    tree
    unzip
    wmctrl
    zoxide
    hw-probe
    # Power Measurement and Management
    cpufrequtils
    powertop
    tlp
    # Desktop
    calibre
    clipmenu
    conky
    evince
    # gnome.gnome-clocks
    # gnome.gnome-dictionary
    # gnome.gnome-disk-utility
    # gnome.nautilus
    gparted
    keepassxc
    kodi
    libnotify
    librewolf
    nodejs_20
    pipe-viewer
    pqiv
    pulsemixer
    qutebrowser-qt6
    tofi
    tridactyl-native
    udisks
    vlc
    xclip
    wl-clipboard
    zathura
    # Emacs Dependencies
    emacs29
    fd
    hunspell
    hunspellDicts.en-gb-ise
    hunspellDicts.en-us
    hunspellDicts.it-it
    nixfmt
    pipenv
    python311
    python311Packages.black
    python311Packages.isort
    python311Packages.nose
    python311Packages.pyflakes
    python311Packages.pytest
    ripgrep
    shellcheck
    shfmt
# Optionals
    # activity-watch
    # aw-watcher-afk
    # aw-watcher-windows
    teams-for-linux
    texlive.combined.scheme-full
    # tikzit
    # ferdium
  # Readability script
    nodePackages.readability-cli
    python311Packages.requests
    python311Packages.readability-lxml
  ];

  imports = [
    # ./programs/firefox.nix
    # ./programs/qtile.nix
    # ./programs/dconf.nix
    ./services.nix
  ];

  qt.platformTheme = "qtct";

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
