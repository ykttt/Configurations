# x86Laptop/nixconfig.nix
#
{
  nix = {
    gc = {
      automatic = true; # Farmful to SSD but nix easily get fulled with trash
      dates = "daily";
      options = "--delete-older-than 5d -d";
    };
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true; # Use binary cache
      experimental-features = ["nix-command" "flakes"];
      substituters = [
        "https://cache.nixos.org"
        "https://wezterm.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="
      ];
    };
  };
  documentation.nixos.enable = false;
}
