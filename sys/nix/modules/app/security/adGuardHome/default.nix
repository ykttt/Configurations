# adGuardHome/default.nix
#
{sysinfo, ...}: {
  networking = {
    networkmanager.dns = "none";
    nameservers = ["127.0.0.1"];
  };
  services.adguardhome = {
    enable = true;
    openFirewall = true;
    settings = {
      http = [{address = "127.0.0.1:3000";}];
      dns = {
        bind_hosts = ["127.0.0.1" "::1"];
        port = 53;
        upstream_dns = [
          "https://dns.adguard-dns.com/dns-query"
          "https://dns10.quad9.net/dns-query"
          "94.140.14.14"
          "172.26.100.1"
          "172.24.32.1"
        ];
      };
      users = [
        {
          name = sysinfo.target;
          password = "$2a$10$sR0Mlbca2YQV1IZoC8XFZ.GJ9HNpBjjy4eYRzCkatABXWDZjGcZuu"; # BCrypt processed (10 times)
        }
      ];
    };
  };
}
