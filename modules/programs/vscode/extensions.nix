{ delib, pkgs, ... }:

delib.module {
  name = "programs.vscode";

  home.ifEnabled =
    let
      tnix = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
        mktplcRef = {
          publisher = "ubugeeei";
          name = "tnix";
          version = "0.3.1";
        };
        vsix = pkgs.fetchurl {
          url = "https://github.com/ubugeeei/tnix/releases/download/v0.3.1/tnix-vscode-v0.3.1.vsix";
          hash = "sha256-wobox639FzHcWhYCNEBZR4ojCXs7wEpXbd95ux0CJN8=";
        };
      };
    in
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
          ryuta46.multi-command
          thang-nm.flow-icons
        ])
        ++ [ tnix ];
    };
}
