# open-webui/default.nix
#
{pkgs, ...}: {
  imports = [./nginx.nix];
  services.open-webui = {
    enable = true;
    package = pkgs.ver24-11.open-webui;
    openFirewall = true;
    host = "127.0.0.1";
    port = 10000;
    environment = {
      OLLAMA_BASE_URL = "http://127.0.0.1:11434";
      OLLAMA_API_BASE_URL = "http://127.0.0.1:11434/api";
      TASK_MODEL = "DailyChat-Llama3-8B";
      WEBUI_AUTH = "True";
      ANONYMIZED_TELEMETRY = "False";
      DO_NOT_TRACK = "True";
      SCARF_NO_ANALYTICS = "True";
    };
  };
}
