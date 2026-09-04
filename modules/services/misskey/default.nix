{
  delib,
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

delib.module {
  name = "services.misskey";

  options = delib.singleEnableOption false;

  nixos.ifEnabled = {
    age.secrets.misskey-sentry-dsn.file = ../../../secrets/misskey-sentry-dsn.age;

    services.misskey = {
      enable = true;

      package = pkgs.misskey.overrideAttrs (prev: {
        inherit ((lib.importJSON "${inputs.misskey}/package.json")) version;
        src = inputs.misskey;
        buildPhase =
          builtins.replaceStrings [ "pnpm run install" ] [ "pnpm run --if-present install" ]
            prev.buildPhase;
        pnpmDeps = prev.pnpmDeps.overrideAttrs {
          outputHash = "sha256-FMWESIav2TQG0X7mlGs4r5gO5mkfVvWvQvwL/Dxs868=";
        };
      });

      database.createLocally = true;
      redis.createLocally = true;

      settings = {
        url = "https://fle.st/";
        port = 3000;
        id = "aid";
        trustProxy = true;
        fulltextSearch.provider = "sqlLike";
        sentryForBackend.options.dsn = "@SENTRY_DSN@";
      };
    };

    systemd.services.misskey = {
      serviceConfig.LoadCredential = [
        "sentry-dsn:${config.age.secrets.misskey-sentry-dsn.path}"
      ];
      preStart = lib.mkAfter ''
        ${pkgs.replace-secret}/bin/replace-secret '@SENTRY_DSN@' "$CREDENTIALS_DIRECTORY/sentry-dsn" /run/misskey/default.yml
        ${pkgs.replace-secret}/bin/replace-secret '@SENTRY_DSN@' "$CREDENTIALS_DIRECTORY/sentry-dsn" /run/misskey/default.json
      '';
    };
  };
}
