[
  # owner (e.g. "mst-mkt")
  (
    { config, lib, ... }:
    {
      options.owner = lib.mkOption {
        type = lib.types.str;
      };

      config.homeManagerUser = lib.mkDefault config.owner;
    }
  )
  # usage ("personal" | "work")
  (
    { config, lib, ... }:
    {
      options = {
        usage = lib.mkOption {
          type = lib.types.enum [
            "personal"
            "work"
          ];
        };
        isPersonal = lib.mkOption {
          type = lib.types.bool;
          default = config.usage == "personal";
        };
        isWork = lib.mkOption {
          type = lib.types.bool;
          default = config.usage == "work";
        };
      };
    }
  )
  # ssh (hostname, cloudflared)
  (
    { lib, ... }:
    {
      options.ssh = {
        hostname = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
        };
        via = lib.mkOption {
          type = lib.types.enum [
            "direct"
            "cloudflared"
          ];
          default = "direct";
        };
      };
    }
  )
]
