# llama-cpp/default.nix
#
{
  lib,
  pkgs,
  utils,
  config,
  ...
}: {
  services.llama-cpp = {
    enable = true;
    openFirewall = true;
    host = "127.0.0.1";
    port = 11434;
    package = pkgs.llama-cpp;
    model = "/llm/current/serverBackend.gguf";
    extraFlags = [
      "--threads"
      "82"
      "--ctx-size"
      "2048"
      "--n-gpu-layers"
      "50"
      "--numa"
      "distribute"
    ];
  };
  systemd.services.llama-cpp = lib.mkIf config.services.llama-cpp.enable {
    serviceConfig = let
      cfg = config.services.llama-cpp;
    in {
      ExecStart = ''
        ${pkgs.nvidia-offload}/bin/nvidia-offload \
        ${cfg.package}/bin/llama-server \
        --log-disable \
        --host ${cfg.host} \
        --port ${builtins.toString cfg.port} \
        --model ${cfg.model} \
        ${utils.escapeSystemdExecArgs cfg.extraFlags}
      '';
    };
  };
}
