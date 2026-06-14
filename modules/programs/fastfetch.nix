{
  delib,
  host,
  pkgs,
  ...
}:

let
  logoEmoji = "🧶";
  logoSize = 20;
  logoUrl = "https://serenity.keito.dev/${logoEmoji}?size=${toString logoSize}";

  fastfetch-wrapped = pkgs.writeShellScriptBin "fastfetch" ''
    logo=$(${pkgs.curl}/bin/curl -s "${logoUrl}")
    if [ -n "$logo" ]; then
      exec ${pkgs.fastfetch}/bin/fastfetch --logo-type data-raw --logo "$logo" "$@"
    else
      exec ${pkgs.fastfetch}/bin/fastfetch "$@"
    fi
  '';
in

delib.module {
  name = "programs.fastfetch";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.programs.fastfetch = {
    enable = true;
    package = fastfetch-wrapped;
    settings = {
      general.detectVersion = false;
      logo.padding = {
        top = 2;
        left = 5;
        right = 6;
      };
      display = {
        separator = " ";
        key.width = 14;
        color.keys = "90";
        percent.color = {
          green = "90";
          yellow = "90";
          red = "90";
        };
      };
      modules = [
        {
          type = "title";
          format = "{#90}▌  {#39}{user-name}@{host-name}";
        }
        {
          type = "custom";
          format = "{#90}▌";
        }
        {
          type = "title";
          key = "▌  user";
          format = "{user-name}";
        }
        {
          type = "title";
          key = "▌  host";
          format = "{host-name}";
        }
        {
          type = "os";
          key = "▌  distro";
          format = "{name} {version-id}";
        }
        {
          type = "kernel";
          key = "▌  kernel";
          format = "{release}";
        }
        {
          type = "packages";
          key = "▌  packages";
        }
        {
          type = "shell";
          key = "▌  shell";
          format = "{pretty-name}";
        }
        {
          type = "wm";
          key = "▌  wm";
          format = "{pretty-name}";
        }
        {
          type = "terminal";
          key = "▌  terminal";
          format = "{pretty-name}";
        }
        {
          type = "cpu";
          key = "▌  cpu";
          format = "{name}";
        }
        {
          type = "memory";
          key = "▌  memory";
        }
        {
          type = "disk";
          key = "▌  disk";
          format = "{size-used} / {size-total} ({size-percentage})";
        }
        {
          type = "datetime";
          key = "▌  time";
          format = "{year}-{month-pretty}-{day-in-month} {hour-pretty}:{minute-pretty}";
        }
      ];
    };
  };
}
