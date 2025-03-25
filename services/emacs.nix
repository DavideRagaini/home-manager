{ pkgs, ... }:

{
  services = {
    emacs = {
      enable = true;
      package = pkgs.emacs30;
      defaultEditor = true;
    };
  };
}
