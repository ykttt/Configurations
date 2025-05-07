# hyprland/keybindings.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.wayland.windowManager.hyprland = let
    masterLayout = true;
  in {
    settings = {
      bind = let
        workspaceActions = builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
              "$mainMod Control, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10);
      in
        [
          "$mainMod, Space, exec, pkill $runmenu || $runmenu"
          "$mainMod, Tab, exec, ags -t overview"
          "$mainMod, Return, exec, $terminal"
          "$mainMod, Q, killactive,"
          "$mainMod Control, Q, exit,"
          "$mainMod, F, togglefloating,"
          "$mainMod Control, F, fullscreen,"
          "$mainMod, N, workspace, 11"
          "$mainMod, Colon, togglespecialworkspace, magic"
          "$mainMod Control, Colon, movetoworkspace, special:magic"
          "$mainMod, mouse_up, workspace, e-1"
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, Print, exec, ags -r 'recorder.start()'"
          ", XF86PowerOff,  exec, ags -t powermenu"
          "Control, Print, exec, ags -r 'recorder.screenshot(true)'"
          ", Print, exec, ags -r 'recorder.screenshot()'"
        ]
        ++ workspaceActions
        ++ (
          if masterLayout
          then [
            "$mainMod, P, pin"
            "$mainMod, H, workspace, e-1"
            "$mainMod, L, workspace, e+1"
            "$mainMod, J, layoutmsg, cyclenext"
            "$mainMod, K, layoutmsg, cycleprev"
            "$mainMod Control, H, movetoworkspace, -1"
            "$mainMod Control, L, movetoworkspace, +1"
            "$mainMod Control, J, layoutmsg, rollnext"
            "$mainMod Control, K, layoutmsg, rollprev"
            "$mainMod Control, Return, layoutmsg, swapwithmaster auto"
          ]
          else [
            "$mainMod, P, pseudo,"
            "$mainMod, T, togglesplit,"
            "$mainMod, H, movefocus, l"
            "$mainMod, J, movefocus, d"
            "$mainMod, K, movefocus, u"
            "$mainMod, L, movefocus, r"
            "$mainMod, A, movewindow, l"
            "$mainMod, W, movewindow, u"
            "$mainMod, S, movewindow, d"
            "$mainMod, D, movewindow, r"
            "$mainMod Control, H, movetoworkspace, -1"
            "$mainMod Control, L, movetoworkspace, +1"
            "$mainMod Control Shift, H, workspace, e-1"
            "$mainMod Control Shift, L, workspace, e+1"
          ]
        );
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };
    extraConfig = ''
      bind = $mainMod, Semicolon, submap, resize
      submap = resize
      binde = , L, resizeactive, 10 0
      binde = , H, resizeactive, -10 0
      binde = , K, resizeactive, 0 -10
      binde = , J, resizeactive, 0 10
      binde = $mainMod, Semicolon, submap, reset
      submap = reset
    '';
  };
}
