# git/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.programs.git = {
    userName = "J. Peng";
    userEmail = "ykttt@tuta.io";
    aliases = {
      a = "add";
      p = "push";
      r = "reset";
      s = "status";
      c = "commit";
      aa = "add *";
      cl = "clone";
      cf = "config";
      co = "checkout";
    };
    extraConfig = {
      init.defaultBranch = "main";
      url = {
        "https://github.com/".insteadOf = ["gh:" "github:"];
        "https://gitlab.com/".insteadOf = ["gl:" "gitlab:"];
      };
    };
  };
}
