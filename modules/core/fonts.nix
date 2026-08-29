{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:

let
  serenity-emoji = inputs.serenity-emoji.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "core.fonts";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled = {
    fonts.enableDefaultPackages = true;

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      udev-gothic-nf
      serenity-emoji.font
    ];

    fonts.fontconfig.defaultFonts = {
      serif = [
        "Noto Serif CJK JP"
        "Noto Color Emoji"
      ];
      sansSerif = [
        "Noto Sans CJK JP"
        "Noto Color Emoji"
      ];
      monospace = [
        "UDEV Gothic NF"
        "Noto Sans Mono CJK JP"
        "Noto Color Emoji"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  darwin.ifEnabled.fonts.packages = with pkgs; [
    udev-gothic-nf
    serenity-emoji.font
  ];
}
