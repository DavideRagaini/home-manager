{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [

      emacs-all-the-icons-fonts

      # ----- Tools -----
      bashdb
      direnv
      fd
      sqlite
      editorconfig-core-c
      ripgrep
      tree-sitter

      # ----- Dictionaries -----
      hunspell
      hunspellDicts.en-gb-ise
      hunspellDicts.en-us
      hunspellDicts.it-it
      wordnet

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

      ## irc
      gnutls

      ## Latex
      graphviz

      ## Lua
      lua-language-server

      ## Mails
      mu
      isync

      ## Markdown
      gh-markdown-preview

      ## Nix
      nixd
      nixfmt-classic
      nixpkgs-fmt
      nixpkgs-review

      ## Node
      nodePackages.bash-language-server
      nodePackages.js-beautify
      nodePackages.prettier
      nodePackages.stylelint
      nodejs_20
      pyright

      ## Python3
      pipenv
      pyenv
      python312
      python312Packages.black
      python312Packages.isort
      # python311Packages.nose
      python312Packages.pip
      python312Packages.pyflakes
      python312Packages.pytest

      ## Shell
      shellcheck
      shfmt

      ## YAML
      yaml-language-server
    ];
  };
}
