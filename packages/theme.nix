{ pkgs, ... }:

{
  home.packages = with pkgs; [
    adwaita-qt
    yaru-theme
    catppuccin-cursors.macchiatoDark
    papirus-icon-theme
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };

  # environment.sessionVariables = { QT_STYLE_OVERRIDE = "adwaita-dark"; };

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
      name = "IosevkaTermSlab Nerd Font Propo";
      size = 18;
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
      size = 32;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-toolbar-style = "GTK_TOOLBAR_BOTH_HORIZ";
      gtk-toolbar-icon-size = "GTK_ICON_SIZE_SMALL_TOOLBAR";
      gtk-button-images = 0;
      gtk-menu-images = 0;
      gtk-enable-event-sounds = 0;
      gtk-enable-input-feedback-sounds = 0;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
      # gtk-decoration-layout=menu:close
      # gtk-application-prefer-dark-theme=1
    };

    gtk4.extraConfig = { gtk-application-prefer-dark-theme = true; };
  };

  home.sessionVariables.GTK_THEME = "yaru";
  dconf.settings = {
    "org/gnome/desktop/interface" = { color-scheme = "prefer-dark"; };
  };
}
