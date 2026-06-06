{ delib, pkgs, ... }:

delib.module {
  name = "core.localization";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {
    time.timeZone = "Asia/Tokyo";

    i18n.defaultLocale = "en_US.UTF-8";

    console = {
      font = "ter-v32n";
      packages = [ pkgs.terminus_font ];
      earlySetup = true;
      keyMap = "jp106";
    };
  };
}
