
{ inputs, config, pkgs, lib, options, ... }:
{
        import = [
        ./hardware.nix
        ./modules.nix
        ];
}

