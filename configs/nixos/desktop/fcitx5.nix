{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-hazkey.nixosModules.hazkey
  ];

  services.hazkey.enable = true;

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with inputs.nix-hazkey.packages.${pkgs.stdenv.system}; [
        fcitx5-hazkey
      ];
    };
  };
}
