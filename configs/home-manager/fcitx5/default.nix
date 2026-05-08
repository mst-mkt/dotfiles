{ inputs, ... }:

{
  imports = [
    inputs.nix-hazkey.homeModules.hazkey
  ];

  services.hazkey.enable = true;

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      settings = {
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
}
