# kitty/settings.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.programs.kitty.settings = {
    allow_remote_control = "yes";
    listen_on = "unix:@kitty-term";
    font_family = "Sarasa Term J";
    font_size = "13.0";
    scrollback_lines = 10000;
    paste_actions = "quote-urls-at-prompt";
    strip_trailing_spaces = "never";
    remote_kitty = "if-needed";
    select_by_word_characters = "@-./_~?&=%+#";
    show_hyperlink_targets = true;
    remember_window_size = false;
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
}
