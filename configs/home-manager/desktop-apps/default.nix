{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vivaldi
    waybar
    fuzzel
    mattermost-desktop
    slack
  ];

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default.extensions =
      (with pkgs.vscode-extensions; [
        github.copilot-chat
        jnoortheen.nix-ide
        streetsidesoftware.code-spell-checker
        thenuprojectcontributors.vscode-nushell-lang
        vitest.explorer
      ])
      ++ [
        pkgs.vscode-marketplace-release-universal.oxc.oxc-vscode
      ];
  };
}
