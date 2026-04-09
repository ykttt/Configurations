# gnome/gnome.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome = {
      core-apps.enable = true;
      core-developer-tools.enable = false;
      core-shell.enable = true;
      core-os-services.enable = true;
      games.enable = false;
      gnome-keyring.enable = true;
    };
  };
  environment.gnome.excludePackages = with pkgs; [
    cheese
    epiphany
    evince
    geary
    gedit
    gnome-calculator
    gnome-characters
    gnome-maps
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
  ];
  home-manager.users.${sysinfo.target} = {
  };
}
