{ delib, ... }:

delib.module {
  name = "programs.niri";

  home.ifEnabled.programs.niri.settings.includes = [
    ./effects.kdl
  ];
}
