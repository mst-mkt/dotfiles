{ pkgs, ... }:

{
  programs.vscode.profiles.default.extensions =
    (with pkgs.vscode-extensions; [
      charliermarsh.ruff
      github.copilot-chat
      ibm.output-colorizer
      jnoortheen.nix-ide
      mkhl.direnv
      ms-python.python
      ms-toolsai.jupyter
      nefrob.vscode-just-syntax
      streetsidesoftware.code-spell-checker
      tamasfe.even-better-toml
      thenuprojectcontributors.vscode-nushell-lang
      usernamehw.errorlens
      vitest.explorer
      yoavbls.pretty-ts-errors
    ])
    ++ (with pkgs.vscode-marketplace-release-universal; [
      ionutvmi.path-autocomplete
      oxc.oxc-vscode
      thang-nm.flow-icons
    ]);
}
