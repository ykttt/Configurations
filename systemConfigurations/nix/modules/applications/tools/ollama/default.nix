# ollama/default.nix
#
{
  lib,
  config,
  ...
}: {
  services.ollama = {
    enable = true;
    autoStart = false;
    home = "/llm";
    acceleration = "cuda";
    models = "/llm/llmRepo";
    openFirewall = true;
    host = "127.0.0.1";
    port = 11434;
    environmentVariables = lib.mkIf config.hardware.nvidia.prime.offload.enable {
      __NV_PRIME_RENDER_OFFLOAD = "1";
      __NV_PRIME_RENDER_OFFLOAD_PROVIDER = "NVIDIA-G0";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __VK_LAYER_NV_optimus = "NVIDIA_only";
      OLLAMA_LLM_LIBRARY = "cuda_v12";
    };
  };
}
