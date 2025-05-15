# openconnect/default.nix
#
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [openconnect];
}
