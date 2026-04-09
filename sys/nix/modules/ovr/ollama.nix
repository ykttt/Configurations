# ovr/ollama.nix
#
{
  lib,
  config,
  ...
}:
with lib; let
  c = config.services.ollama;
in {
  options.services.ollama.autoStart = mkOption {
    type = types.bool;
    default = true;
    description = "Automatically start the ollama service at boot.";
  };
  config.systemd.services.ollama = mkIf c.enable {
    wantedBy = mkIf (!c.autoStart) (mkForce []);
  };
}
