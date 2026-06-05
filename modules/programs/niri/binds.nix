{ delib, ... }:

delib.module {
  name = "programs.niri";

  home.ifEnabled.programs.niri.settings.binds = {
    "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];

    "Mod+Return" = {
      action.spawn = "wezterm";
      hotkey-overlay.title = "Open a Terminal: wezterm";
    };

    "XF86AudioRaiseVolume" = {
      action.spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "0.1+"
        "-l"
        "1.0"
      ];
      allow-when-locked = true;
    };
    "XF86AudioLowerVolume" = {
      action.spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "0.1-"
      ];
      allow-when-locked = true;
    };
    "XF86AudioMute" = {
      action.spawn = [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SINK@"
        "toggle"
      ];
      allow-when-locked = true;
    };
    "XF86AudioMicMute" = {
      action.spawn = [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SOURCE@"
        "toggle"
      ];
      allow-when-locked = true;
    };

    "XF86MonBrightnessUp" = {
      action.spawn = [
        "brightnessctl"
        "--class=backlight"
        "set"
        "+10%"
      ];
      allow-when-locked = true;
    };
    "XF86MonBrightnessDown" = {
      action.spawn = [
        "brightnessctl"
        "--class=backlight"
        "set"
        "10%-"
      ];
      allow-when-locked = true;
    };

    "Mod+O" = {
      action.toggle-overview = [ ];
      repeat = false;
    };
    "Mod+N" = {
      action.spawn = [
        "widgets"
        "toggle"
        "notification"
      ];
      hotkey-overlay.title = "Toggle Notification Panel: widgets";
      repeat = false;
    };
    "Mod+Shift+Q" = {
      action.close-window = [ ];
      repeat = false;
    };

    "Mod+Left".action.focus-column-left = [ ];
    "Mod+Down".action.focus-window-down = [ ];
    "Mod+Up".action.focus-window-up = [ ];
    "Mod+Right".action.focus-column-right = [ ];
    "Mod+H".action.focus-column-left = [ ];
    "Mod+J".action.focus-window-down = [ ];
    "Mod+K".action.focus-window-up = [ ];
    "Mod+L".action.focus-column-right = [ ];

    "Mod+Shift+Left".action.move-column-left = [ ];
    "Mod+Shift+Down".action.move-window-down = [ ];
    "Mod+Shift+Up".action.move-window-up = [ ];
    "Mod+Shift+Right".action.move-column-right = [ ];
    "Mod+Shift+H".action.move-column-left = [ ];
    "Mod+Shift+J".action.move-window-down = [ ];
    "Mod+Shift+K".action.move-window-up = [ ];
    "Mod+Shift+L".action.move-column-right = [ ];

    "Mod+Ctrl+Left".action.focus-monitor-left = [ ];
    "Mod+Ctrl+Down".action.focus-monitor-down = [ ];
    "Mod+Ctrl+Up".action.focus-monitor-up = [ ];
    "Mod+Ctrl+Right".action.focus-monitor-right = [ ];
    "Mod+Ctrl+H".action.focus-monitor-left = [ ];
    "Mod+Ctrl+J".action.focus-monitor-down = [ ];
    "Mod+Ctrl+K".action.focus-monitor-up = [ ];
    "Mod+Ctrl+L".action.focus-monitor-right = [ ];

    "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [ ];
    "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = [ ];
    "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = [ ];
    "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [ ];
    "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = [ ];
    "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = [ ];
    "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = [ ];
    "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = [ ];

    "Mod+Page_Down".action.focus-workspace-down = [ ];
    "Mod+Page_Up".action.focus-workspace-up = [ ];
    "Mod+U".action.focus-workspace-down = [ ];
    "Mod+I".action.focus-workspace-up = [ ];

    "Mod+Shift+Page_Down".action.move-column-to-workspace-down = [ ];
    "Mod+Shift+Page_Up".action.move-column-to-workspace-up = [ ];
    "Mod+Shift+U".action.move-column-to-workspace-down = [ ];
    "Mod+Shift+I".action.move-column-to-workspace-up = [ ];

    "Mod+Ctrl+Page_Down".action.move-workspace-down = [ ];
    "Mod+Ctrl+Page_Up".action.move-workspace-up = [ ];
    "Mod+Ctrl+U".action.move-workspace-down = [ ];
    "Mod+Ctrl+I".action.move-workspace-up = [ ];

    "Mod+1".action.focus-workspace = 1;
    "Mod+2".action.focus-workspace = 2;
    "Mod+3".action.focus-workspace = 3;
    "Mod+4".action.focus-workspace = 4;
    "Mod+5".action.focus-workspace = 5;
    "Mod+6".action.focus-workspace = 6;
    "Mod+7".action.focus-workspace = 7;
    "Mod+8".action.focus-workspace = 8;
    "Mod+9".action.focus-workspace = 9;

    "Mod+Shift+1".action.move-column-to-workspace = 1;
    "Mod+Shift+2".action.move-column-to-workspace = 2;
    "Mod+Shift+3".action.move-column-to-workspace = 3;
    "Mod+Shift+4".action.move-column-to-workspace = 4;
    "Mod+Shift+5".action.move-column-to-workspace = 5;
    "Mod+Shift+6".action.move-column-to-workspace = 6;
    "Mod+Shift+7".action.move-column-to-workspace = 7;
    "Mod+Shift+8".action.move-column-to-workspace = 8;
    "Mod+Shift+9".action.move-column-to-workspace = 9;

    "Mod+BracketLeft".action.consume-or-expel-window-left = [ ];
    "Mod+BracketRight".action.consume-or-expel-window-right = [ ];
    "Mod+Comma".action.consume-window-into-column = [ ];
    "Mod+Period".action.expel-window-from-column = [ ];

    "Mod+R".action.switch-preset-column-width = [ ];
    "Mod+Shift+R".action.switch-preset-column-width-back = [ ];
    "Mod+Minus".action.set-column-width = "-10%";
    "Mod+Equal".action.set-column-width = "+10%";

    "Mod+F".action.maximize-column = [ ];
    "Mod+Shift+F".action.fullscreen-window = [ ];
    "Mod+Ctrl+F".action.expand-column-to-available-width = [ ];

    "Mod+V".action.toggle-window-floating = [ ];
    "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [ ];
    "Mod+W".action.toggle-column-tabbed-display = [ ];

    "Print".action.screenshot-screen = [ ];
    "Mod+Shift+S".action.screenshot = [ ];

    "Mod+Escape" = {
      action.spawn = [
        "widgets"
        "close"
      ];
      repeat = false;
    };
    "Ctrl+Alt+Delete".action.quit = [ ];
    "Mod+Shift+P".action.power-off-monitors = [ ];
  };
}
