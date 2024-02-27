{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # ----- Tools -----
      bashdb
      direnv
      fd
      ripgrep
      zeal

      # ----- Dictionaries -----
      hunspell
      hunspellDicts.en-gb-ise
      hunspellDicts.en-us
      hunspellDicts.it-it

      # ----- Development -----

      ## Go
      gomodifytags
      gopls
      gore
      gotests
      gotools

      ## html
      html-tidy
      libxml2

      ## Latex
      graphviz

      ## Lua
      lua-language-server

      ## Markdown
      gh-markdown-preview

      ## Nix
      nixfmt
      nixpkgs-fmt
      nixpkgs-review

      ## Node
      nodePackages.bash-language-server
      nodePackages.js-beautify
      nodePackages.prettier
      nodePackages.stylelint
      nodejs_20

      ## Python3
      pipenv
      python311
      python311Packages.black
      python311Packages.isort
      python311Packages.nose
      python311Packages.pyflakes
      python311Packages.pytest

      ## Shell
      shellcheck
      shfmt

      ## YAML
      yaml-language-server
    ];
  };
}
