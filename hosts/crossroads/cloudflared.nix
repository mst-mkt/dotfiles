{
  delib,
  config,
  ...
}:

delib.host {
  name = "crossroads";

  nixos = {
    age.secrets.cloudflared-credentials.file = ../../secrets/cloudflared-credentials.json.age;

    services.cloudflared = {
      enable = true;
      tunnels."flestudio" = {
        credentialsFile = config.age.secrets.cloudflared-credentials.path;
        default = "http_status:404";
        ingress = {
          "crossroads.fle.st".service = "ssh://localhost:22";
          "fle.st".service = "http://localhost:3000";
        };
      };
    };
  };
}
