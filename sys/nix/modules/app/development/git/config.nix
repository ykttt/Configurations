# git/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.programs.git.settings = {
    user = {
      name = "J. Peng";
      email = "ykttt@tuta.io";
    };
    alias = {
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
    init.defaultBranch = "main";
    url = {
      "https://github.com/".insteadOf = ["gh:" "github:"];
      "https://gitlab.com/".insteadOf = ["gl:" "gitlab:"];
    };
  };
}
