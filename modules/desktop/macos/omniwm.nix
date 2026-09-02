{
  delib,
  host,
  inputs,
  lib,
  pkgs,
  rice,
  ...
}:

let
  nur-packages = inputs.nur-packages.packages.${pkgs.stdenv.hostPlatform.system};

  hexToRgba =
    hex:
    let
      str = lib.toLower (builtins.substring 1 6 hex);
      ch = n: lib.fromHexString (builtins.substring n 2 str) * 1.0 / 255.0;
    in
    {
      red = ch 0;
      green = ch 2;
      blue = ch 4;
      alpha = 1.0;
    };
in

delib.module {
  name = "desktop.omniwm";

  options = delib.singleEnableOption host.guiFeatured;

  home.always.imports = [ inputs.nur-packages.homeModules.omniwm ];

  home.ifEnabled.programs.omniwm = {
    enable = true;
    package = nur-packages.omniwm;

    settings = {
      schemaVersion = 1;

      general = {
        defaultLayoutType = "niri";
        ipcEnabled = true;
        animationsEnabled = true;
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
        containerPrimarySpanPresets = [
          0.333
          0.5
          0.667
        ];
      };

      borders = {
        enabled = true;
        width = 4.0;
        color = hexToRgba rice.colors.accent;
      };

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

      appearance = {
        mode = "automatic";
      };
    };
  };
}
