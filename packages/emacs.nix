{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      direnv
      emacs29
      fd
      gomodifytags
      gopls
      gore
      gotests
      gotools
      gh-markdown-preview
      graphviz
      html-tidy
      hunspell
      hunspellDicts.en-gb-ise
      hunspellDicts.en-us
      hunspellDicts.it-it
      libxml2
      nixfmt
      nixpkgs-fmt
      nixpkgs-review
      nodePackages.bash-language-server
      nodePackages.js-beautify
      nodePackages.prettier
      nodePackages.stylelint
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
