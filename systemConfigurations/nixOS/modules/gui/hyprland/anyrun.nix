

# hyprland/anyrun.nix

{
  home-manager.users.km = {
    inputs,
    pkgs,
    ...
  }: {
    imports = [
      inputs.anyrun.homeManagerModules.default
    ];
    nix.settings = {
      builders-use-substitutes = true;
      extra-substituters = [ "https://anyrun.cachix.org" ];
      extra-trusted-public-keys = [ "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s=" ];
    };
    programs.anyrun = {
      enable = true;
      config = {
        x = { fraction = 0.5; };
        y = { fraction = 0.2; };
        width = { fraction = 0.3; };
        hideIcons = false;
        ignoreExclusiveZones = false;
        layer = "overlay";
        hidePluginInfo = false;
        closeOnClick = false;
        showResultsImmediately = false;
        maxEntries = null;
        plugins = with inputs.anyrun.packages.${pkgs.system}; [
          applications
          dictionary
          websearch
          rink
          shell
          kidex
        ];
      };
      extraCss = ''
        * {
          all: unset;
          font-size: 1.3rem;
        } #window, #match, #entry, #plugin, #main {
          background: transparent;
        } #match.activatable {
          border-radius: 16px;
          padding: 0.3rem 0.9rem;
          margin-top: 0.01rem;
        } #match.activatable:first-child {
          margin-top: 0.7rem;
        } #match.activatable:last-child {
          margin-bottom: 0.6rem;
        } #plugin:hover #match.activatable {
          border-radius: 10px;
          padding: 0.3rem;
          margin-top: 0.01rem;
          margin-bottom: 0;
        } #match:selected, #match:hover, #plugin:hover {
          background: #2e3131;
        } #entry {
          background: #0b0f10;
          border: 1px solid #0b0f10;
          border-radius: 16px;
          margin: 0.5rem;
          padding: 0.3rem 1rem;
        } list > #plugin {
          border-radius: 16px;
          margin: 0 0.3rem;
        } list > #plugin:first-child {
          margin-top: 0.3rem;
        } list > #plugin:last-child {
          margin-bottom: 0.3rem;
        } list > #plugin:hover {
          padding: 0.6rem;
        } box#main {
          background: #0b0f10;
          box-shadow: inset 0 0 0 1px #0b0f10, 0 0 0 1px #0b0f10;
          border-radius: 24px;
          padding: 0.3rem;
        }
      '';
      extraConfigFiles = {
        "applications.ron".text = ''
          Config(
            desktop_actions: false,
            max_entries: 5,
            terminal: Some("kitty"),
          ) '';
        "shell.ron".text = ''
          Config(
            prefix: ";",
            shell: None,
          )
        '';
        "kidex.ron".text = ''
          Config(
            max_entries: 3,
          )
        '';
        "dictionary.ron".text = ''
          Config(
            prefix: ":",
            max_entries: 5,
          )
        '';
        "websearch.ron".text = ''
          Config(
            prefix: "/",
              // Custom(
              //   name: "Searx",
              //   url: "searx.be/?q={}",
              // )
            engines: [DuckDuckGo]
          )
        '';
      };
    };
    home.stateVersion = "24.05";
  };
}
