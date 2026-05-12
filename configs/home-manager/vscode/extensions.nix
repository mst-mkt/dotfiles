{ pkgs, ... }:

{
  programs.vscode.profiles.default.extensions =
    (with pkgs.vscode-extensions; [
      charliermarsh.ruff
      github.copilot-chat
      jnoortheen.nix-ide
      mkhl.direnv
      ms-python.python
      ms-toolsai.jupyter
      nefrob.vscode-just-syntax
      streetsidesoftware.code-spell-checker
      tamasfe.even-better-toml
      thenuprojectcontributors.vscode-nushell-lang
      vitest.explorer
    ])
    ++ (with pkgs.vscode-marketplace-release-universal; [
      oxc.oxc-vscode
      thang-nm.flow-icons
    ]);
}
