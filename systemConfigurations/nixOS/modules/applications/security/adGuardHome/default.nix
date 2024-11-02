

# adGuardHome/default.nix

{
  networking = {
    networkmanager.dns = "none";
    nameservers = [ "127.0.0.1" ];
  };
  services.adguardhome = {
    enable = true;
    openFirewall = true;
    settings = {
      http = [ { address = "127.0.0.1:3000";} ];
      users = [ {
        name = "km";
        password = "$2a$10$sR0Mlbca2YQV1IZoC8XFZ.GJ9HNpBjjy4eYRzCkatABXWDZjGcZuu";    # BCrypt processed (10 times)
      } ];
    };
  };
}
