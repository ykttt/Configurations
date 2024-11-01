
{ inputs, config, pkgs, lib, options, ... }:
{
        imports = [
                ./hardware.nix
                ./modules.nix
        ];
}

