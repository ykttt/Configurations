

# emacs/default.nix

{
  # environment.variables.EDITOR = "emacs";
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    programs.emacs = {
      enable = true;
      extraPackages = (epkgs:
        with epkgs; [
          evil
        ]);
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
    home.stateVersion = "24.05";
  };
}
