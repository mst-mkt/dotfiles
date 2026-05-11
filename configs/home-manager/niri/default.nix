{ pkgs, lib, ... }:

{
  imports = [
    ./layout.nix
    ./window-rules.nix
    ./binds.nix
  ];

  programs.niri.settings = {
    prefer-no-csd = true;

    input = {
      keyboard = {
        xkb.layout = "jp";
        numlock = true;
      };
      touchpad = {
        tap = true;
        natural-scroll = true;
      };
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "0%";
      };
    };

    spawn-at-startup = [
      { command = [ "waybar" ]; }
      {
        command = [
          "fcitx5"
          "-d"
          "-r"
        ];
      }
    ];

    xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite-unstable;

    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
  };
}
