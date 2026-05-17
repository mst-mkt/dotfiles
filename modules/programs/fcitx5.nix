{
  delib,
  host,
  inputs,
  ...
}:

delib.module {
  name = "programs.fcitx5";

  options = delib.singleEnableOption host.guiFeatured;

  home.always.imports = [ inputs.nix-hazkey.homeModules.hazkey ];

  home.ifEnabled = {
    services.hazkey.enable = true;

    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        settings = {
          globalOptions = {
            "Hotkey/ActivateKeys"."0" = "Muhenkan";
            "Hotkey/DeactivateKeys"."0" = "Henkan_Mode";
          };
          inputMethod = {
            GroupOrder."0" = "Default";
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIM = "keyboard-us";
            };
            "Groups/0/Items/0".Name = "hazkey";
            "Groups/0/Items/1".Name = "keyboard-us";
          };
        };
      };
    };
  };
}
