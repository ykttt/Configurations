# llama-cpp/default.nix
#
{
  import = [./override.nix];
  services.llama-cpp = {
    enable = true;
    autoStart = false;
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
}
