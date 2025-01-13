# ollama/default.nix
#
{
  services.ollama = {
    enable = true;
    home = "/llm";
    acceleration = "cuda";
    models = "/llm/models";
    openFirewall = true;
    host = "127.0.0.1";
    port = 11434;
  };
}
