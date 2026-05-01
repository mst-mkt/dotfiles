{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    udev-gothic-nf
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
}
