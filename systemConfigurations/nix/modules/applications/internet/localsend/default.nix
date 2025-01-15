# localsend/default.nix
#
{
  home-manager.users.km = {...}: {
    pograms.localsend = {
      enable = true;
      openFirewall = true;
    };
    home.stateVersion = "24.05";
  };
}
