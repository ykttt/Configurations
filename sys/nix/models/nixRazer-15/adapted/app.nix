# modules/app.nix
#
{
  imports = [
    ../../../modules/app/development/git
    ../../../modules/app/development/direnv
    ../../../modules/app/development/haskell

    ../../../modules/app/editing/libreOffice
    ../../../modules/app/editing/nvim
    ../../../modules/app/editing/emacs
    ../../../modules/app/editing/tex

    ../../../modules/app/gaming/steam
    ../../../modules/app/gaming/prismLauncher

    ../../../modules/app/internet/discord
    ../../../modules/app/internet/onedrive
    ../../../modules/app/internet/zoom
    ../../../modules/app/internet/zen
    ../../../modules/app/internet/localsend
    ../../../modules/app/internet/openconnect

    ../../../modules/app/media/mpv
    ../../../modules/app/media/you-get

    ../../../modules/app/security/1Password
    ../../../modules/app/security/adGuardHome

    ../../../modules/app/tools/rofi
    ../../../modules/app/tools/basic
    ../../../modules/app/tools/kitty
    ../../../modules/app/tools/starship
    ../../../modules/app/tools/thunar
    ../../../modules/app/tools/yazi
    ../../../modules/app/tools/peazip
    ../../../modules/app/tools/obs-studio
    ../../../modules/app/tools/ollama
    ../../../modules/app/tools/nextjs-ollama-llm-ui
  ];
}
