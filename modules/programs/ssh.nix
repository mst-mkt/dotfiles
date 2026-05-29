{
  delib,
  host,
  lib,
  pkgs,
  ...
}:

delib.module {
  name = "programs.ssh";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled =
    { myconfig, ... }:
    let
      reachVia = {
        direct = { };
        cloudflared.ProxyCommand = "${lib.getExe pkgs.cloudflared} access ssh --hostname %h";
      };

      reachableHosts = lib.filterAttrs (
        name: h: h.ssh.hostname != null && name != host.name
      ) myconfig.hosts;
    in
    {
      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;
        settings = lib.mapAttrs' (
          _: h: lib.nameValuePair h.ssh.hostname reachVia.${h.ssh.via}
        ) reachableHosts;
      };
    };
}
