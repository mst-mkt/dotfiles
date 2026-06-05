{
  delib,
  host,
  constants,
  ...
}:

let
  cacheDir = "/home/${constants.username}/.cache/spotifyd";
in
delib.module {
  name = "programs.spotifyd";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled = {
    services.spotifyd = {
      enable = true;
      settings.global = {
        device_name = host.name;
        device_type = "computer";
        backend = "pulseaudio";
        bitrate = 320;
        cache_path = cacheDir;
        use_mpris = true;
        dbus_type = "session";
      };
    };

    age.secrets.spotifyd-oauth-credentials = {
      file = ../../secrets/spotifyd-oauth-credentials.json.age;
      path = "${cacheDir}/oauth/credentials.json";
    };
  };
}
