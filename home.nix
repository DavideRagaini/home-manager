{ config, pkgs, ... }:

{
  # xdg.userDirs.enable = true;
  # home.sessionVariables = {
  #   SUDO_ASKPASS = "pkgs.rofi -dmenu -password";
  # };

  # home.keyboard.layout = "us-intl";
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
    hw-probe
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
    spotify-tui
    # sqlite
    transmission
    tree
    tremc
    unzip
    wcalc
    wmctrl
    zoxide
    # Power Measurement and Management
    # cpufrequtils
    powertop
    tlp
    # Desktop
    # alfred
    ani-cli
    calibre
    clipmenu
    # ferdium
    # gparted
    keepassxc
    kodi
    libnotify
    librewolf
    mangal
    # nodejs_20
    pdftk
    pipe-viewer
    pulsemixer
    qutebrowser-qt6
    # tridactyl-native
    # vlc
    # X11
    # rofi
    # rofimoji
    conky
    xclip
    zathura
    # Wayland
    # pqiv
    # tofi
    # evince
    # emacs-29pgtk
    # wl-clipboard
    # Emacs Dependencies
    emacs
    fd
    hunspell
    hunspellDicts.en-gb-ise
    hunspellDicts.en-us
    hunspellDicts.it-it
    nixfmt
    pinentry
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
    # teams-for-linux
    texlive.combined.scheme-full
    # tikzit
    # ferdium
    # Readability script
    # nodePackages.readability-cli
    # python311Packages.requests
    # python311Packages.readability-lxml
  ];

  imports = [
    # ./programs/firefox.nix
    # ./programs/qtile.nix
    # ./programs/dconf.nix
    ./services.nix
  ];

  # qt.platformTheme = "qtct";

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    file = { };

    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    username = "davide";
    homeDirectory = "/home/davide";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.05"; # Please read the comment before changing.
  };

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

  gtk = {
    enable = false;

    # iconTheme = {
    #   name = "Papirus-Dark";
    #   package = pkgs.papirus-icon-theme;
    # };

    # theme = {
    #   name = "yaru-theme";
    #   package = pkgs.yaru-theme;
    # };

    cursorTheme = {
      name = "Catppuccin-Macchiato-Dark-Cursors";
      package = pkgs.catppuccin-cursors.macchiatoDark;
    };

    #   gtk3.extraConfig = {
    #     Settings = ''
    #       gtk-application-prefer-dark-theme=1
    #     '';
    #   };

    #   gtk4.extraConfig = {
    #     Settings = ''
    #       gtk-application-prefer-dark-theme=1
    #     '';
    #   };
    # };

    # home.sessionVariables.GTK_THEME = "yaru";
  };
  # Some weird bug
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
