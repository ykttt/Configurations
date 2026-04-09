# nextjs-ollama-llm-ui/default.nix
#
{
  imports = [../open-webui/nginx.nix];
  services.nextjs-ollama-llm-ui = {
    enable = true;
    hostname = "127.0.0.1";
    ollamaUrl = "http://127.0.0.1:11434";
    port = 10000;
  };
}
