

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
        # background = "/home/km/.local/share/backgrounds/bg.png";
        # blurRadius = 10;
        backgroundFill = "#24273a";
        backgroundFillMode= "aspect";
        passwordInputCursorVisible = true;
        showSessionsByDefault = false;
        # passwordCursorColor = "random";
        passwordCursorColor = "#f2d5cf";
        basicTextColor = "#babbf1";
        passwordTextColor = "#eebebe";
        hideCursor = true;
      };
    }
  )];
}
