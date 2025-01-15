# kitty/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.programs.kitty.keybindings = {
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
}
