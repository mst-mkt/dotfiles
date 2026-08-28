{ delib, ... }:

delib.module {
  name = "programs.niri";

  home.ifEnabled.wayland.windowManager.niri.settings.binds = {
    "Mod+Shift+Slash".show-hotkey-overlay = { };

    "Mod+Return" = {
      _props.hotkey-overlay-title = "Open a Terminal: ghostty";
      spawn = "ghostty";
    };
    "Mod+D" = {
      _props = {
        hotkey-overlay-title = "Run an Application: widgets";
        repeat = false;
      };
      spawn = [
        "widgets"
        "open"
        "launcher"
      ];
    };

    "XF86AudioRaiseVolume" = {
      _props.allow-when-locked = true;
      spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "0.1+"
        "-l"
        "1.0"
      ];
    };
    "XF86AudioLowerVolume" = {
      _props.allow-when-locked = true;
      spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "0.1-"
      ];
    };
    "XF86AudioMute" = {
      _props.allow-when-locked = true;
      spawn = [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SINK@"
        "toggle"
      ];
    };
    "XF86AudioMicMute" = {
      _props.allow-when-locked = true;
      spawn = [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SOURCE@"
        "toggle"
      ];
    };

    "XF86MonBrightnessUp" = {
      _props.allow-when-locked = true;
      spawn = [
        "brightnessctl"
        "--class=backlight"
        "set"
        "+10%"
      ];
    };
    "XF86MonBrightnessDown" = {
      _props.allow-when-locked = true;
      spawn = [
        "brightnessctl"
        "--class=backlight"
        "set"
        "10%-"
      ];
    };

    "Mod+O" = {
      _props.repeat = false;
      toggle-overview = { };
    };
    "Mod+N" = {
      _props = {
        hotkey-overlay-title = "Toggle Notification Panel: widgets";
        repeat = false;
      };
      spawn = [
        "widgets"
        "toggle"
        "notification"
      ];
    };
    "Mod+Shift+Q" = {
      _props.repeat = false;
      close-window = { };
    };

    "Mod+Left".focus-column-left = { };
    "Mod+Down".focus-window-down = { };
    "Mod+Up".focus-window-up = { };
    "Mod+Right".focus-column-right = { };
    "Mod+H".focus-column-left = { };
    "Mod+J".focus-window-down = { };
    "Mod+K".focus-window-up = { };
    "Mod+L".focus-column-right = { };

    "Mod+Shift+Left".move-column-left = { };
    "Mod+Shift+Down".move-window-down = { };
    "Mod+Shift+Up".move-window-up = { };
    "Mod+Shift+Right".move-column-right = { };
    "Mod+Shift+H".move-column-left = { };
    "Mod+Shift+J".move-window-down = { };
    "Mod+Shift+K".move-window-up = { };
    "Mod+Shift+L".move-column-right = { };

    "Mod+Ctrl+Left".focus-monitor-left = { };
    "Mod+Ctrl+Down".focus-monitor-down = { };
    "Mod+Ctrl+Up".focus-monitor-up = { };
    "Mod+Ctrl+Right".focus-monitor-right = { };
    "Mod+Ctrl+H".focus-monitor-left = { };
    "Mod+Ctrl+J".focus-monitor-down = { };
    "Mod+Ctrl+K".focus-monitor-up = { };
    "Mod+Ctrl+L".focus-monitor-right = { };

    "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = { };
    "Mod+Shift+Ctrl+Down".move-column-to-monitor-down = { };
    "Mod+Shift+Ctrl+Up".move-column-to-monitor-up = { };
    "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = { };
    "Mod+Shift+Ctrl+H".move-column-to-monitor-left = { };
    "Mod+Shift+Ctrl+J".move-column-to-monitor-down = { };
    "Mod+Shift+Ctrl+K".move-column-to-monitor-up = { };
    "Mod+Shift+Ctrl+L".move-column-to-monitor-right = { };

    "Mod+Page_Down".focus-workspace-down = { };
    "Mod+Page_Up".focus-workspace-up = { };
    "Mod+U".focus-workspace-down = { };
    "Mod+I".focus-workspace-up = { };

    "Mod+Shift+Page_Down".move-column-to-workspace-down = { };
    "Mod+Shift+Page_Up".move-column-to-workspace-up = { };
    "Mod+Shift+U".move-column-to-workspace-down = { };
    "Mod+Shift+I".move-column-to-workspace-up = { };

    "Mod+Ctrl+Page_Down".move-workspace-down = { };
    "Mod+Ctrl+Page_Up".move-workspace-up = { };
    "Mod+Ctrl+U".move-workspace-down = { };
    "Mod+Ctrl+I".move-workspace-up = { };

    "Mod+1".focus-workspace = 1;
    "Mod+2".focus-workspace = 2;
    "Mod+3".focus-workspace = 3;
    "Mod+4".focus-workspace = 4;
    "Mod+5".focus-workspace = 5;
    "Mod+6".focus-workspace = 6;
    "Mod+7".focus-workspace = 7;
    "Mod+8".focus-workspace = 8;
    "Mod+9".focus-workspace = 9;

    "Mod+Shift+1".move-column-to-workspace = 1;
    "Mod+Shift+2".move-column-to-workspace = 2;
    "Mod+Shift+3".move-column-to-workspace = 3;
    "Mod+Shift+4".move-column-to-workspace = 4;
    "Mod+Shift+5".move-column-to-workspace = 5;
    "Mod+Shift+6".move-column-to-workspace = 6;
    "Mod+Shift+7".move-column-to-workspace = 7;
    "Mod+Shift+8".move-column-to-workspace = 8;
    "Mod+Shift+9".move-column-to-workspace = 9;

    "Mod+BracketLeft".consume-or-expel-window-left = { };
    "Mod+BracketRight".consume-or-expel-window-right = { };
    "Mod+Comma".consume-window-into-column = { };
    "Mod+Period".expel-window-from-column = { };

    "Mod+R".switch-preset-column-width = { };
    "Mod+Shift+R".switch-preset-column-width-back = { };
    "Mod+Minus".set-column-width = "-10%";
    "Mod+Equal".set-column-width = "+10%";

    "Mod+F".maximize-column = { };
    "Mod+Shift+F".fullscreen-window = { };
    "Mod+Ctrl+F".expand-column-to-available-width = { };

    "Mod+V".toggle-window-floating = { };
    "Mod+Shift+V".switch-focus-between-floating-and-tiling = { };
    "Mod+W".toggle-column-tabbed-display = { };

    "Print".screenshot-screen = { };
    "Mod+Shift+S".screenshot = { };

    "Mod+Escape" = {
      _props.repeat = false;
      spawn = [
        "widgets"
        "close"
      ];
    };
    "Ctrl+Alt+Delete".quit = { };
    "Mod+Shift+P".power-off-monitors = { };
  };
}
