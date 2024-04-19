{ config, lib, pkgs, ... }:

{
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = [
        "zathura.desktop"
        "sioyek.desktop"
        "okular.desktop"
        "org.gnome.Evince.desktop"
      ];
      "application/ogg" = "mpv.desktop";
      "application/x-desktop" = "emacs.desktop";
      "application/x-extension-htm" = [
        "firefox.desktop"
        "librewolf.desktop"
        "brave.desktop"
        "qutebrowser.desktop"
      ];
      "application/x-extension-html" = [
        "firefox.desktop"
        "librewolf.desktop"
        "brave.desktop"
        "qutebrowser.desktop"
      ];
      "application/x-extension-shtml" = [
        "firefox.desktop"
        "librewolf.desktop"
        "brave.desktop"
        "qutebrowser.desktop"
      ];
      "application/x-extension-xht" = [
        "firefox.desktop"
        "librewolf.desktop"
        "brave.desktop"
        "qutebrowser.desktop"
      ];
      "application/x-extension-xhtml" = [
        "firefox.desktop"
        "librewolf.desktop"
        "brave.desktop"
        "qutebrowser.desktop"
      ];
      "application/x-flash-video" = "mpv.desktop";
      "application/x-ruby" = "emacsslient.desktop";
      "application/x-shellscript" =
        [ "alacritty.desktop" "footclient.desktop" "foot.desktop" ];
      "application/xhtml+xml" = [
        "firefox.desktop"
        "librewolf.desktop"
        "brave.desktop"
        "qutebrowser.desktop"
      ];
      "audio/mp4" = "mpv.desktop";
      "audio/mpeg" = "mpv.desktop";
      "audio/x-flac" = "mpv.desktop";
      "image/jpeg" = "nsxiv.desktop";
      "image/png" = "nsxiv.desktop";
      "image/vnd.djvu" = "zathura.desktop";
      "inode/directory" = "lf.desktop";
      "inode/x-empty" = "emacsslient.desktop";
      "text/html" = [ "emacsclient.desktop" "nvim.desktop" ];
      "text/plain" = "emacsclient.desktop";
      "text/rhtml" = "emacsslient.desktop";
      "text/x-java" = "emacsclient.desktop";
      "text/x-markdown" = "emacsclient.desktop";
      "text/x-python" = "emacsslient.desktop";
      "text/x-readme" = "emacsslient.desktop";
      "text/x-ruby" = "emacsslient.desktop";
      "text/x-tex" = "emacsslient.desktop";
      "video/H264" = "mpv.desktop";
      "video/mp4" = "mpv.desktop";
      "video/ogg" = "mpv.desktop";
      "video/quicktime" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/x-flv" = "mpv.desktop";
      "video/x-msvideo" = "mpv.desktop";
      "x-content/audio-player" = "mpv.desktop";
      "x-scheme-handler/chrome" = "firefox.desktop";
      "x-scheme-handler/ftp" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
    };

    defaultApplications = {
      "application/pdf" = [
        "zathura.desktop"
        "sioyek.desktop"
        "okular.desktop"
        "org.gnome.Evince.desktop"
      ];
      "application/ogg" = "mpv.desktop";
      "application/x-desktop" = "emacs.desktop";
      "application/x-extension-htm" = [
        "firefox.desktop"
        "librewolf.desktop"
        "brave.desktop"
        "qutebrowser.desktop"
      ];
      "application/x-extension-html" = [
        "firefox.desktop"
        "librewolf.desktop"
        "brave.desktop"
        "qutebrowser.desktop"
      ];
      "application/x-extension-shtml" = [
        "firefox.desktop"
        "librewolf.desktop"
        "brave.desktop"
        "qutebrowser.desktop"
      ];
      "application/x-extension-xht" = [
        "firefox.desktop"
        "librewolf.desktop"
        "brave.desktop"
        "qutebrowser.desktop"
      ];
      "application/x-extension-xhtml" = [
        "firefox.desktop"
        "librewolf.desktop"
        "brave.desktop"
        "qutebrowser.desktop"
      ];
      "application/x-flash-video" = "mpv.desktop";
      "application/x-ruby" = "emacsslient.desktop";
      "application/x-shellscript" =
        [ "alacritty.desktop" "footclient.desktop" "foot.desktop" ];
      "application/xhtml+xml" = [
        "firefox.desktop"
        "librewolf.desktop"
        "brave.desktop"
        "qutebrowser.desktop"
      ];
      "audio/mp4" = "mpv.desktop";
      "audio/mpeg" = "mpv.desktop";
      "audio/x-mpequrl" = "mpv.desktop";
      "audio/x-flac" = "mpv.desktop";
      "image/apng" = [ "nsxiv.desktop" "feh.desktop" "pqiv.desktop" ];
      "image/avif" = [ "nsxiv.desktop" "feh.desktop" "pqiv.desktop" ];
      "image/gif" = [ "nsxiv.desktop" "feh.desktop" "pqiv.desktop" ];
      "image/jpeg" = [ "nsxiv.desktop" "feh.desktop" "pqiv.desktop" ];
      "image/png" = [ "nsxiv.desktop" "feh.desktop" "pqiv.desktop" ];
      "image/svg+xml" = [ "nsxiv.desktop" "feh.desktop" "pqiv.desktop" ];
      "image/webp" = [ "nsxiv.desktop" "feh.desktop" "pqiv.desktop" ];
      "image/vnd.djvu" = "zathura.desktop";
      "inode/directory" = "lf.desktop";
      "inode/x-empty" = "emacsslient.desktop";
      "text/html" = [ "emacsclient.desktop" "nvim.desktop" ];
      "text/plain" = "emacsclient.desktop";
      "text/rhtml" = "emacsslient.desktop";
      "text/x-java" = "emacsclient.desktop";
      "text/x-markdown" = "emacsclient.desktop";
      "text/x-python" = "emacsslient.desktop";
      "text/x-readme" = "emacsslient.desktop";
      "text/x-ruby" = "emacsslient.desktop";
      "text/x-tex" = "emacsslient.desktop";
      "video/H264" = "mpv.desktop";
      "video/mp4" = "mpv.desktop";
      "video/mvk" = "mpv.desktop";
      "video/ogg" = "mpv.desktop";
      "video/quicktime" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/x-flv" = "mpv.desktop";
      "video/x-msvideo" = "mpv.desktop";
      "x-content/audio-player" = "mpv.desktop";
      "x-scheme-handler/mw-matlab" = "mw-matlab.desktop";
      "x-scheme-handler/mw-simulink" = "mw-simulink.desktop";
      "x-scheme-handler/mw-matlabconnector" = "mw-matlabconnector.desktop";
      "x-scheme-handler/chrome" = "firefox.desktop";
      "x-scheme-handler/ftp" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "text/xml" =
        [ "emacs.desktop" "emacsclient.desktop" "nvim.desktop" "vi.desktop" ];
    };
  };
}
