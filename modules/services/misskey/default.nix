{
  delib,
  host,
  config,
  lib,
  pkgs,
  ...
}:

delib.module {
  name = "services.misskey";

  options = delib.singleEnableOption host.misskeyFeatured;

  nixos.ifEnabled = {
    age.secrets.misskey-sentry-dsn.file = ../../../secrets/misskey-sentry-dsn.age;

    services.misskey = {
      enable = true;

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
      '';
    };
  };
}
