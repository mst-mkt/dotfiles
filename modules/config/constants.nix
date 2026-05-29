{ delib, ... }:

delib.module {
  name = "config.constants";

  options.constants = with delib; {
    username = readOnly (strOption "mst-mkt");
    useremail = readOnly (strOption "mail@keito.dev");
  };
}
