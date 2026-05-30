{
  delib,
  host,
  config,
  inputs,
  ...
}:

let
  dbSettings = config.services.misskey.settings.db;
in
delib.module {
  name = "services.misskey.backup";

  options = delib.singleEnableOption host.misskeyFeatured;

  nixos.ifEnabled = {
    age.secrets.misskey-backup-env.file = ../../../secrets/misskey-backup-env.age;

    systemd.services.misskey-backup = {
      description = "Misskey database backup (fle.st)";
      after = [
        "misskey.service"
        "postgresql.target"
      ];

      environment = {
        DATABASE = dbSettings.db;
        PGHOST = dbSettings.host;
        PGPORT = toString dbSettings.port;
        PGUSER = dbSettings.user;
        OUTPUT_DIR = "/var/lib/misskey-backup";
        S3_PREFIX = "backups";
        RETENTION_DAYS = "7";
      };

      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${inputs.pgbackup.packages.${host.system}.default}/bin/pgbackup";
        EnvironmentFile = config.age.secrets.misskey-backup-env.path;
        DynamicUser = true;
        User = dbSettings.user;
        StateDirectory = "misskey-backup";
        StateDirectoryMode = "0700";
        WorkingDirectory = "/var/lib/misskey-backup";
      };
    };

    systemd.timers.misskey-backup = {
      description = "Misskey database backup (fle.st)";
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* 4,16:00:00";
        Persistent = true;
        Unit = "misskey-backup.service";
      };
    };
  };
}
