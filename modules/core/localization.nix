{ delib, ... }:

delib.module {
  name = "core.localization";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {
    time.timeZone = "Asia/Tokyo";

    i18n.defaultLocale = "en_US.UTF-8";

    console = {
      font = "Lat2-Terminus16";
      keyMap = "jp106";
    };
  };
}
