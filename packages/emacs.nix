{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      emacs29
      direnv
      fd
      graphviz
      hunspell
      hunspellDicts.en-gb-ise
      hunspellDicts.en-us
      hunspellDicts.it-it
      libxml2
      nixfmt
      nixpkgs-fmt
      nixpkgs-review
      nodejs_20
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
    ];
  };
}
