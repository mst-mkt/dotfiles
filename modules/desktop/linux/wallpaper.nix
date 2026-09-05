{
  config,
  delib,
  homeConfig,
  host,
  lib,
  pkgs,
  rice,
  ...
}:

let
  sessionTarget = homeConfig.wayland.systemd.target;

  privateBaseUrl = "https://wallpapers.keito.dev/";
  secretPath = config.age.secrets.cf-access-wallpaper.path;

  # Wallpapers that cannot be redistributed live in private storage.
  # It is accessed with a Cloudflare Access service token.
  fetchPrivate =
    { url, hash }:
    pkgs.runCommand (baseNameOf url)
      {
        nativeBuildInputs = [ pkgs.curl ];
        outputHashMode = "flat";
        outputHash = hash;
        env.SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
      }
      ''curl --fail --silent --show-error --config ${secretPath} --output "$out" ${lib.escapeShellArg url}'';

  wallpaper =
    if lib.types.path.check rice.wallpaper then
      rice.wallpaper
    else if lib.hasPrefix privateBaseUrl rice.wallpaper.url then
      fetchPrivate rice.wallpaper
    else
      pkgs.fetchurl { inherit (rice.wallpaper) url hash; };
in

delib.module {
  name = "desktop.wallpaper";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled = {
    # Readable from build sandboxes so fetchPrivate can use it
    age.secrets.cf-access-wallpaper = {
      file = ../../../secrets/cf-access-wallpaper.age;
      group = "nixbld";
      mode = "0440";
    };
    nix.settings.extra-sandbox-paths = [ "${secretPath}?" ];
  };

  home.ifEnabled.systemd.user.services.wallpaper = {
    Unit = {
      Description = "Set the wallpaper";
      PartOf = [ sessionTarget ];
      After = [ sessionTarget ];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.wbg} --stretch ${wallpaper}";
      Restart = "on-failure";
    };
    Install.WantedBy = [ sessionTarget ];
  };
}
