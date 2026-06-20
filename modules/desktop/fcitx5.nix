{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "desktop.fcitx5";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled = {
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = [ pkgs.fcitx5-mellow-themes ];
        settings = {
          globalOptions = {
            "Hotkey/TriggerKeys"."0" = "Zenkaku_Hankaku";
            "Hotkey/ActivateKeys"."0" = "Henkan_Mode";
            "Hotkey/DeactivateKeys"."0" = "Muhenkan";
            "Hotkey/AltTriggerKeys" = { };
            "Behavior".ShowFirstInputMethodInformation = false;
            "Behavior/DisabledAddons"."0" = "clipboard";
          };
          inputMethod = {
            GroupOrder."0" = "Default";
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIM = "hazkey";
            };
            "Groups/0/Items/0".Name = "keyboard-us";
            "Groups/0/Items/1".Name = "hazkey";
          };
          addons.classicui.globalSection = {
            "Vertical Candidate List" = true;
            WheelForPaging = false;
            PreferTextIcon = true;
            Theme = "mellow-graphite-dark";
          };
          addons.keyboard.globalSection.EnableHintByDefault = true;
        };
      };
    };
  };
}
