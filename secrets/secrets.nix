let
  keys = import ./keys.nix;
  inherit (keys) hosts;
  users = builtins.concatLists (builtins.attrValues keys.users);
in
{
  "cloudflared-credentials.json.age".publicKeys = users ++ [ hosts.crossroads ];
  "misskey-sentry-dsn.age".publicKeys = users ++ [ hosts.crossroads ];
  "misskey-backup-env.age".publicKeys = users ++ [ hosts.crossroads ];
  "spotifyd-oauth-credentials.json.age".publicKeys = users ++ [ hosts.dirtmouth ];
  "gws-client-secret.json.age".publicKeys = users ++ builtins.attrValues hosts;
}
