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

      package = (pkgs.misskey.override { nodejs = pkgs.nodejs_26; }).overrideAttrs (prev: {
        inherit ((lib.importJSON "${inputs.misskey}/package.json")) version;
        src = inputs.misskey;
        postPatch = "";
        pnpmDeps = prev.pnpmDeps.overrideAttrs {
          outputHash = "sha256-zm25NWE+NaklRK/vc8Ti28QdDINqFp17MkT1uWuDF0M=";
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
      environment.HOME = "/var/lib/misskey";
      serviceConfig = {
        Restart = "on-failure";
        RestartSec = "5s";
        RestrictNamespaces = true;
        SystemCallFilter = [ "@system-service" ];
        SystemCallErrorNumber = "EPERM";
        LoadCredential = [
          "sentry-dsn:${config.age.secrets.misskey-sentry-dsn.path}"
        ];
        ExecStartPre = lib.mkAfter [
          (pkgs.writeShellScript "misskey-replace-sentry-dsn" ''
            set -euo pipefail
            ${pkgs.replace-secret}/bin/replace-secret '@SENTRY_DSN@' "$CREDENTIALS_DIRECTORY/sentry-dsn" /run/misskey/default.yml
          '')
        ];
      };
    };
  };
}
