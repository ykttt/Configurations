# /../modules/default.nix
#
{
  imports = [
    ../../../modules/applications/creativity/krita

    ../../../modules/applications/development/git
    ../../../modules/applications/development/haskell

    ../../../modules/applications/editing/libreOffice
    ../../../modules/applications/editing/nvim
    ../../../modules/applications/editing/tex

    ../../../modules/applications/gaming/steam

    ../../../modules/applications/internet/discord
    ../../../modules/applications/internet/onedrive
    ../../../modules/applications/internet/zoom
    ../../../modules/applications/internet/zen
    ../../../modules/applications/internet/localsend

    ../../../modules/applications/media/mpv
    ../../../modules/applications/media/you-get

    ../../../modules/applications/security/1Password
    ../../../modules/applications/security/adGuardHome

    ../../../modules/applications/tools/basic
    ../../../modules/applications/tools/kitty
    ../../../modules/applications/tools/nemo
    ../../../modules/applications/tools/starship
    ../../../modules/applications/tools/yazi
    ../../../modules/applications/tools/ollama

    ../../../modules/applications/virtualisation/virtualBox
  ];
}
