{ pkgs, ... }:

{

  home = {
    packages = with pkgs; [
      adwaita-qt
      catppuccin-cursors.macchiatoDark
      papirus-icon-theme
    ];
    sessionVariables = {
      # QT_QPA_PLATFORMTHEME = "qt6ct";
      # QT_STYLE_OVERRIDE = "adwaita-dark";
      # QT_STYLE_OVERRIDE = "kvantum";
      SAL_USE_VCLPLUGIN = "qt6"; # libreoffice
      GTK_THEME = "catppuccin-frappe-blue-standard";
    };

  #   pointerCursor = {
  #     sway = {
  #       enable = true;
  #       size = 48;
  #     };
  #     name = "Catppuccin-Macchiato-Dark-Cursors";
  #     package = pkgs.catppuccin-cursors.macchiatoDark;
  #   };
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      package = pkgs.catppuccin-kde;
      name = "catppuccin-macchiato-dark";
    };
  };

  gtk = {
    enable = true;
    font = {
      # name = "IosevkaTermSlab Nerd Font Propo";
      name = "Liberation Sans";
      size = 14;
    };

    iconTheme = {
      name = "breeze";
      # package = pkgs.catppuccin-icon;
    };

    theme = {
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk;
    };

    cursorTheme = {
      name = "catppuccin-macchiato-dark-cursors";
      package = pkgs.catppuccin-cursors;
      size = 16;
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

    gtk4 = {
      theme = null;
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
