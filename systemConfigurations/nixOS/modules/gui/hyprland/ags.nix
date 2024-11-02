

# hyprland/ags.nix

{
  security = {
    polkit.enable = true;
    pam.services.ags = {};
  };
  home-manager.users.km = {
    inputs,
    pkgs,
    ...
  }: {
    imports = [
      inputs.ags.homeManagerModules.default
    ];
    home.packages = with pkgs; [
      fd
      fzf
      bun
      swww
      slurp
      swappy
      wayshot
      matugen
      playerctl
      dart-sass
      hyprpicker
      wf-recorder
      pwvucontrol
      wl-clipboard
      brightnessctl
    ];
    programs.ags = {
      enable = true;
      # configDir = ../../externalPackageSettings/ags;
      extraPackages = with pkgs; [
        accountsservice
      ];
    };
    home.stateVersion = "24.05";
  };
}
