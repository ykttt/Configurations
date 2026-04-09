# bash/default.nix
#
{pkgs, ...}: {
  imports = [
    ./aliases.nix
  ];
  users.defaultUserShell = pkgs.bash;
  programs.bash = {
    enable = true;
    completion.enable = true;
    undistractMe.enable = true;
    interactiveShellInit = ''
      echo "\n" && macchina -t greet -o uptime -o host -o distribution -o packages -o kernel -o shell -o processor-load -o memory
    '';
  };
}
