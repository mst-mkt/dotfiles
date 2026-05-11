{ ... }:

{
  programs.niri.settings.input = {
    keyboard = {
      xkb.layout = "jp";
      numlock = true;
    };

    touchpad = {
      tap = true;
      natural-scroll = true;
      dwt = true;
    };

    focus-follows-mouse = {
      enable = true;
      max-scroll-amount = "100%";
    };

    workspace-auto-back-and-forth = true;
  };
}
