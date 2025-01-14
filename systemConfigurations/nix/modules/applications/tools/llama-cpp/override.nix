# llama-cpp/override.nix
#
{
  lib,
  config,
  ...
}:
with lib; {
  options.services.llama-cpp.autoStart = mkOption {
    type = lib.types.bool;
    default = true;
    description = "Automatically start the llama-cpp service at boot.";
  };
  config.systemd.services.llama-cpp = {
    wantedBy = mkIf (!config.services.llama-cpp.autoStart) [];
    environment = mkIf config.hardware.nvidia.prime.offload.enable {
      __NV_PRIME_RENDER_OFFLOAD = "1";
      __NV_PRIME_RENDER_OFFLOAD_PROVIDER = "NVIDIA-G0";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __VK_LAYER_NV_optimus = "NVIDIA_only";
    };
  };
}
