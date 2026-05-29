let
  keys = import ./keys.nix;
  inherit (keys) hosts;
  users = builtins.concatLists (builtins.attrValues keys.users);
in
{
  "cloudflared-credentials.json.age".publicKeys = users ++ [ hosts.crossroads ];
}
