# ollama/nginx.nix
#
{
  services.nginx = {
    enable = true;
    virtualHosts."192.168.0.109" = {
      listen = [
        {
          addr = "192.168.0.109";
          port = 11435;
        }
      ];
      locations."/".proxyPass = "http://127.0.0.1:11435";
    };
  };
}
