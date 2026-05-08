{ inputs, ... }:

{
  imports = [
    inputs.nix-hazkey.homeModules.hazkey
  ];

  services.hazkey.enable = true;

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
  };
}
