# emacs/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {
    pkgs,
    config,
    ...
  }: let
    emacsWrapped = pkgs.emacs.pkgs.withPackages (
      epkgs:
        with epkgs; [
          # Core & tools
          use-package
          origami
          org-roam
          string-edit-at-point
          which-key
          diff-hl
          devdocs
          helpful
          vterm
          magit
          forge
          meow
          # Completion & jump
          vertico
          orderless
          marginalia
          consult
          consult-tex
          consult-lsp
          consult-todo
          consult-flycheck
          consult-org-roam
          consult-yasnippet
          embark
          embark-consult
          corfu
          cape
          yasnippet
          yasnippet-snippets
          all-the-icons-completion
          # UI / tree / modeline
          popper
          org-modern
          centaur-tabs
          column-enforce-mode
          define-word
          flycheck
          flycheck-haskell
          hl-todo
          diminish
          all-the-icons
          doom-modeline
          doom-modeline-now-playing
          treemacs
          treemacs-all-the-icons
          treemacs-tab-bar
          rainbow-delimiters
          indent-bars
          treesit-auto
          nerd-icons-corfu
          dashboard
          imenu-list
          alert
          # LSP / DAP / formatting
          dap-mode
          lsp-mode
          lsp-ui
          lsp-treemacs
          lsp-haskell
          lsp-latex
          lsp-pyright
          lsp-origami
          # Languages
          haskell-mode
          auctex
          auctex-latexmk
          cdlatex
          pdf-tools
          py-isort
          # Themes
          ewal
          ewal-doom-themes
          ewal-spacemacs-themes
        ]
    );

    tsLibPath = pkgs.symlinkJoin {
      name = "ts-grammars";
      paths = let
        g = pkgs.tree-sitter-grammars;
        suf = "tree-sitter-";
        names = [
          "c"
          "python"
          "haskell"
          "bash"
          "tex"
          "nix"
          "lua"
          "json"
          "conf"
        ];
      in
        map (n: g."${suf}${n}") (
          builtins.filter
          (n: builtins.hasAttr "${suf}${n}" g)
          names
        );
    };
  in {
    home.packages = with pkgs; [
      nil
      ruff
      isort
      stylua
      ripgrep
      ltex-ls
      gnumake
      pyright
      alejandra
      codespell
      libnotify
      clang-tools
      lua-language-server
      emacs-lsp-booster
      emacs-all-the-icons-fonts
      tsLibPath
    ];
    programs.emacs = {
      enable = true;
      package = emacsWrapped;
    };
    services.emacs = {
      enable = true;
      package = emacsWrapped;
      client.enable = true;
    };
    home.file = with config; let
      destiDir = "${home.homeDirectory}/Repositories/Configurations/app/emacs";
    in {
      "${home.homeDirectory}/.emacs.d/lisp".source =
        lib.file.mkOutOfStoreSymlink
        "${destiDir}/lisp";
      "${home.homeDirectory}/.emacs.d/init.el".source =
        lib.file.mkOutOfStoreSymlink
        "${destiDir}/init.el";
    };
    xdg.mimeApps = {
      associations.added = {
        "application/json" = "emacs.desktop";
        "application/x-docbook+xml" = "emacs.desktop";
        "application/x-yaml" = "emacs.desktop";
        "application/x-zerosize" = "emacs.desktop";
        "text/markdown" = "emacs.desktop";
        "text/plain" = "emacs.desktop";
        "text/x-cmake" = "emacs.desktop";
      };
      #   defaultApplications = {
      #     "application/json" = "emacs.desktop";
      #     "application/x-docbook+xml" = "emacs.desktop";
      #     "application/x-yaml" = "emacs.desktop";
      #     "application/x-zerosize" = "emacs.desktop";
      #     "text/markdown" = "emacs.desktop";
      #     "text/plain" = "emacs.desktop";
      #     "text/x-cmake" = "emacs.desktop";
      #   };
    };
    # Point Emacs (via env var) to Nix’s tree-sitter libraries, but don’t hardcode in Nix Lisp.
    home.sessionVariables.TS_GRAMMARS_DIR = "${tsLibPath}/lib";
  };
}
