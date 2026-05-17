{ ... }:

{
  imports = [
    ./binds.nix
    ./input.nix
    ./layout.nix
    ./outputs.nix
    ./startup.nix
    ./window-rules.nix
  ];

  programs.niri.settings = {
    prefer-no-csd = true;
    hotkey-overlay.skip-at-startup = true;
    screenshot-path = "~/Pictures/screenshots/%Y-%m-%d_%H-%M-%S.png";
  };
}
