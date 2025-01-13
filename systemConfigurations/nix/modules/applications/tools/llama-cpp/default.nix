# llama-cpp/default.nix
#
{
  lib,
  config,
  ...
}: {
  services.llama-cpp = {
    enable = true;
    openFirewall = true;
    host = "127.0.0.1";
    port = 11434;
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
    serviceConfig.Environment = lib.optional config.hardware.nvidia.prime.offload.enable [
      "__NV_PRIME_RENDER_OFFLOAD=1"
      "__NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0"
      "__GLX_VENDOR_LIBRARY_NAME=nvidia"
      "__VK_LAYER_NV_optimus=NVIDIA_only"
    ];
  };
}
