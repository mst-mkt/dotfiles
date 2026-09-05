[
  (
    { lib, ... }:
    {
      options = {
        colors = lib.genAttrs [
          "background"
          "backdrop"
          "accent"
          "accentSoft"
          "inactive"
          "urgent"
        ] (_: lib.mkOption { type = lib.types.str; });

        wallpaper = lib.mkOption {
          type = lib.types.either lib.types.path (
            lib.types.submodule {
              options = {
                url = lib.mkOption { type = lib.types.str; };
                hash = lib.mkOption { type = lib.types.str; };
              };
            }
          );
        };

        cursor = {
          name = lib.mkOption { type = lib.types.str; };
          package = lib.mkOption { type = lib.types.package; };
          size = lib.mkOption { type = lib.types.int; };
        };

        iconTheme = {
          name = lib.mkOption { type = lib.types.str; };
          package = lib.mkOption { type = lib.types.package; };
        };

        ghostty.theme = lib.mkOption { type = lib.types.str; };
        vscode.colorTheme = lib.mkOption { type = lib.types.str; };
      };
    }
  )
]
