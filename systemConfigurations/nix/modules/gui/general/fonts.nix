# general/default.nix
#
{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.noto
      nerd-fonts.jetbrains-mono
      wqy_zenhei # Required by pkgs.steam to display CJK characters
      noto-fonts
      sarasa-gothic
      noto-fonts-emoji
      noto-fonts-extra
      noto-fonts-cjk-sans
    ];
    fontDir.enable = true;
    fontconfig.enable = true;
  };
}
