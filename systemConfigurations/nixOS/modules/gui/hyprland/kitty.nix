

# hyprland/kitty.nix

{
  home-manager.users.km = {
    programs.kitty = {
      enable = true;
      # themeFile = "Nord";
      keybindings = {
        "alt+t" = "new_tab";
        "alt+tab" = "next_tab";
        "alt+shift+tab" = "previous_tab";
        "alt+i" = "launch --location=hsplit";
        "alt+o" = "launch --location=vsplit";
        "ctrl+alt+h" = "neighboring_window left";
        "ctrl+alt+j" = "neighboring_window down";
        "ctrl+alt+k" = "neighboring_window up";
        "ctrl+alt+l" = "neighboring_window right";
        "ctrl+alt+a" = "move_window left";
        "ctrl+alt+s" = "move_window down";
        "ctrl+alt+w" = "move_window up";
        "ctrl+alt+d" = "move_window right";
      };
      settings = {
        font_family = "Sarasa Term J";
        font_size = "13.0";
        scrollback_lines = 10000;
        paste_actions = "quote-urls-at-prompt";
        strip_trailing_spaces = "never";
        remote_kitty = "if-needed";
        select_by_word_characters = "@-./_~?&=%+#";
        show_hyperlink_targets = true;
        remember_window_size  = false;
        initial_window_width = 1000;
        initial_window_height = 618;
        tab_bar_style = "powerline";
        tab_powerline_style = "round";
        enabled_layouts = "splits";
        tab_bar_align = "left";
        tab_bar_edge = "bottom";
        background_opacity = "0.8";
        background_blur = 1;
      };
    };
    home.stateVersion = "24.05";
  };
}
