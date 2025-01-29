# overrides/ollama.nix
#
{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.services.ollama;
in {
  options.services.ollama.autoStart = mkOption {
    type = lib.types.bool;
    default = true;
    description = "Automatically start the ollama service at boot.";
  };
  config.systemd.services.ollama = mkIf cfg.enable {
    wantedBy = mkIf (!cfg.autoStart) (mkForce []);
  };
}
