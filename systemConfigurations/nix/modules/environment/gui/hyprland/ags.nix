# hyprland/ags.nix
#
{
  lib,
  config,
  sysinfo,
  ...
}: let
  hypr = config.programs.hyprland;
in {
  security = {
    polkit.enable = true;
    pam.services.ags = {};
  };

  home-manager.users.${sysinfo.target} = {
    pkgs,
    inputs,
    ...
  }: {
    imports = [inputs.ags.homeManagerModules.default];
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
    wayland.windowManager.hyprland.settings = with lib;
      mkIf hypr.enable (mkForce {
        exec-once = ["ags &"];
        bind = [
          "$mainMod, Tab, exec, ags -t overview"
          "$mainMod, Print, exec, ags -r 'recorder.start()'"
          ", XF86PowerOff,  exec, ags -t powermenu"
          "Control, Print, exec, ags -r 'recorder.screenshot(true)'"
          ", Print, exec, ags -r 'recorder.screenshot()'"
        ];
      });
  };
}
