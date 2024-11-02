

# razer/default.nix

{
  pkgs,
  ...
}: {
  hardware.openrazer.enable = true;     # For razer devices
  environment.systemPackages = [ pkgs.openrazer-daemon ]; # For razer devices
  home-manager.users.km = { pkgs, ... }: {
    home.packages = with pkgs; [
      polychromatic
      alsa-tools      # In order to fix audio issues on Razer Blade 15 (2023)
    ];
  home.stateVersion = "24.05";
  };
}
