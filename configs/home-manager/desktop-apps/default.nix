{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vivaldi
    waybar
    fuzzel
  ];

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];
  };
}
