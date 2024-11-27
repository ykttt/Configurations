

# matlabImpure/default.nix

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    matlab
    mesa
  ];
}
