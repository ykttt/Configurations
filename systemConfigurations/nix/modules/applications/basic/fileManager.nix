

# basic/fileManager.nix

{
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    home.packages = [ pkgs.nemo ];
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      package = pkgs.yazi.override {
        _7zz = (pkgs._7zz.override { useUasm = true; });
      };
    };
    home.stateVersion = "24.05";
  };
}
