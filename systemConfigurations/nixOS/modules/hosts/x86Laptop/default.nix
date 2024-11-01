#
#
#	x86Laptop/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
        imports = [
                "./boot.nix"
                "./hardware.nix"
                "./i18n.nix"
                "./network.nix"
                "./nixConfig.nix"
                "./security.nix"
        ];
}
