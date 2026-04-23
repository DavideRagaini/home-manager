{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [

      emacs-all-the-icons-fonts

      # ----- Tools -----
      # bashdb
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

      # cc
      emacs.pkgs.clang-format
      glslang

      ## Docker
      dockfmt

      ## Go
      gomodifytags
      gopls
      gore
      gotests
      # gotools

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
      emacs.pkgs.markdown-preview-mode

      ## Nix
      nixd
      nixfmt
      nixpkgs-fmt
      nixpkgs-review

      ## Node
      # nodePackages.bash-language-server
      # nodePackages.js-beautify
      # nodePackages.prettier
      # nodePackages.stylelint
      nodejs_24
      # pyright

      # Org
      python313Packages.jupyter-core

      ## Python3
      # pipenv
      # pyenv
      python313
      python313Packages.black
      python313Packages.cython
      python313Packages.isort
      python313Packages.pip
      python313Packages.pyflakes
      python313Packages.pytest
      ruff
      ty
      uv

      ## Shell
      shellcheck
      shfmt

      # vterm
      gnumake
      cmakeMinimal
      libtool

      ## YAML
      yaml-language-server
    ];
  };
}
