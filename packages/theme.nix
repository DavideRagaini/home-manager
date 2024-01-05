{ config, pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };

  home = {
    pointerCursor = {
      x11.enable = true;
      size = 48;
      name = "Catppuccin-Macchiato-Dark-Cursors";
      package = pkgs.catppuccin-cursors.macchiatoDark;
    };
  };

  gtk = {
    enable = true;
    font = {
      name = "IosevkaTerm Nerd Font Propo";
      size = 10;
    };
    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-cursor-theme-size = 0
        gtk-toolbar-style = GTK_TOOLBAR_BOTH
        gtk-toolbar-icon-size = GTK_ICON_SIZE_SMALL_TOOLBAR
        gtk-button-images = 1
        gtk-menu-images = 1
        gtk-enable-event-sounds = 0
        gtk-enable-input-feedback-sounds = 0
        gtk-xft-antialias = 1
        gtk-xft-hinting = 1
        gtk-xft-hintstyle = "hintfull"
        gtk-xft-rgba = "rgb"
      '';
    };
    gtk3 = {
      extraConfig = {
        gtk-cursor-blink  =  true;
        gtk-cursor-theme-size = 0;
        gtk-enable-event-sounds = 0;
        gtk-enable-input-feedback-sounds = 0;
        gtk-menu-images = 1;
        gtk-primary-button-warps-slider = 0;
        gtk-recent-files-limit  =  20;
        gtk-toolbar-icon-size = "GTK_ICON_SIZE_SMALL_TOOLBAR";
        gtk-toolbar-style = "GTK_TOOLBAR_BOTH";
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
        gtk-xft-rgba = "rgb";
      };
    };
    gtk4 = {
      extraConfig = {
        gtk-cursor-blink  =  true;
        gtk-recent-files-limit  =  20;
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "yaru-theme";
      package = pkgs.yaru-theme;
    };
    cursorTheme = {
      name = "Catppuccin-Macchiato-Dark-Cursors";
      package = pkgs.catppuccin-cursors.macchiatoDark;
      size = 48;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  home.sessionVariables.GTK_THEME = "yaru";
}
