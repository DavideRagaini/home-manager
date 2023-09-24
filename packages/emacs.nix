{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      emacs
      fd
      hunspell
      hunspellDicts.en-gb-ise
      hunspellDicts.en-us
      hunspellDicts.it-it
      nixfmt
      nixpkgs-fmt
      nixpkgs-review
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
