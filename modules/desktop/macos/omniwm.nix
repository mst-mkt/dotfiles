{
  delib,
  host,
  inputs,
  pkgs,
  ...
}:

let
  omniwmLib = inputs.omniwm.lib;
in

delib.module {
  name = "desktop.omniwm";

  options = delib.singleEnableOption host.guiFeatured;

  home.always.imports = [ inputs.omniwm.homeManagerModules.default ];

  home.ifEnabled.programs.omniwm = {
    enable = true;

    settings = {
      general = {
        defaultLayoutType = "niri";
        ipcEnabled = true;
        animationsEnabled = true;
      };

      focus = {
        followsMouse = true;
      };

      gaps = {
        size = 16.0;
        outer = {
          left = 16.0;
          right = 16.0;
          top = 16.0;
          bottom = 16.0;
        };
      };

      niri = {
        visibleContainerCount = 1;
        centerFocusedColumn = "never";
        infiniteLoop = true;
        containerPrimarySpanPresets = [
          0.333
          0.5
          0.667
        ];
      };

      borders = {
        enabled = false;
      };

      workspaces = omniwmLib.workspaces [
        { displayName = "browse"; }
        { displayName = "code"; }
        { displayName = "chat"; }
      ];

      workspaceBar = {
        enabled = true;
        showLabels = true;
      };

      quakeTerminal = {
        enabled = false;
      };

      clipboard = {
        historyEnabled = true;
      };

      gestures = {
        workspaceSwipeEnabled = true;
        workspaceSwipeFingerCount = 3;
        workspaceSwipeAxis = "vertical";
      };

      appearance = {
        mode = "automatic";
      };
    };
  };
}
