{ ... }:

{
  imports = [
    ./layout.nix
    ./window-rules.nix
    ./binds.nix
  ];

  programs.niri.settings = {
    input = {
      keyboard = {
        xkb.layout = "jp";
        numlock = true;
      };
      touchpad = {
        tap = true;
        natural-scroll = true;
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

    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
  };
}
