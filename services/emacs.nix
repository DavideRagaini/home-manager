{ pkgs, ... }:

{
  services = {
    emacs = {
      enable = true;
      package = pkgs.emacs-pgtk;
      defaultEditor = true;
    };
  };
}
