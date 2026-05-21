{ delib, ... }:

delib.module {
  name = "programs.niri";

  home.ifEnabled.programs.niri.settings.spawn-at-startup = [
    { command = [ "waybar" ]; }
    {
      command = [
        "fcitx5"
        "-d"
        "-r"
      ];
    }
  ];
}
