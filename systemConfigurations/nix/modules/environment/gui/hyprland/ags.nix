# hyprland/ags.nix
#
{
  pkgs,
  inputs,
  sysinfo,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];
  security = {
    polkit.enable = true;
    pam.services.ags = {};
  };
  home-manager.users.${sysinfo.target} = {
    home.packages = with pkgs;
      [
        fd
        fzf
        bun
        swww
        slurp
        swappy
        wayshot
        playerctl
        dart-sass
        hyprpicker
        wf-recorder
        pwvucontrol
        wl-clipboard
        brightnessctl
      ]
      ++ (with inputs; [
        matugen.packages.${system}.default
      ]);
    programs.ags = {
      enable = true;
      # configDir = ../../externalPackageSettings/ags;
      extraPackages = with pkgs; [
        accountsservice
      ];
    };
  };
}
