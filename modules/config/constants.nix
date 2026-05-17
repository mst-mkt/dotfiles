{ delib, ... }:

delib.module {
  name = "config.constants";

  options.constants = with delib; {
    username = readOnly (strOption "mst-mkt");
    useremail = readOnly (strOption "mail@keito.dev");
    hostname = readOnly (strOption "zenbook");
    system = readOnly (strOption "x86_64-linux");
    stateVersion = readOnly (strOption "25.11");
  };
}
