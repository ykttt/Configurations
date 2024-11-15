

# general/sddm.nix

{
  pkgs,
  ...
}: {
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    theme = "where_is_my_sddm_theme";
    extraPackages = [ pkgs.kdePackages.qt5compat ];
  };
  environment.systemPackages = [(
    pkgs.where-is-my-sddm-theme.override {
      themeConfig.General = {
        background = "/home/km/.local/share/backgrounds/bg.png";
        backgroundMode = "none";
        passwordInputCursorVisible = true;
        showSessionsByDefault = true;
        blurRadius = 10;
        basicTextColor = "#babbf1";
        hideCursor = true;
      };
    }
  )];
}
