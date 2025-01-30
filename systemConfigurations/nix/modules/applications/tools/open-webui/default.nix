# open-webui/default.nix
#
{...}: {
  services.open-webui = {
    enable = true;
    openFirewall = true;
    host = "127.0.0.1";
    port = 10000;
    environment = ''
      {
        OLLAMA_BASE_URL = "http://127.0.0.1:11434";
        TASK_MODEL = "Llama3-Chat";
        WEBUI_AUTH = "False";
        DEFAULT_LOCALE = "jp";
        ANONYMIZED_TELEMETRY = "False";
        DO_NOT_TRACK = "True";
        SCARF_NO_ANALYTICS = "True";
      }
    '';
  };
}
