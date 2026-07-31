{
  delib,
  pkgs,
  inputs,
  ...
}:

let
  extensions = inputs.nix-vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.vscode";

  home.ifEnabled =
    let
      tnix = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
        mktplcRef = {
          publisher = "ubugeeei";
          name = "tnix";
          version = "0.5.0";
        };
        vsix = pkgs.fetchurl {
          url = "https://github.com/ubugeeei/tnix/releases/download/v0.5.0/tnix-vscode-v0.5.0.vsix";
          hash = "sha256-bXIGClx5CN5SLciZ+Dk7CqLN6zPSwxYgq3zrsCIIHzA=";
        };
      };
    in
    {
      programs.vscode.profiles.default.extensions =
        (with pkgs.vscode-extensions; [
          antfu.slidev
          charliermarsh.ruff
          github.copilot-chat
          golang.go
          graphql.vscode-graphql-syntax
          ibm.output-colorizer
          jnoortheen.nix-ide
          mkhl.direnv
          ms-python.python
          ms-toolsai.jupyter
          nefrob.vscode-just-syntax
          oxc.oxc-vscode
          rust-lang.rust-analyzer
          streetsidesoftware.code-spell-checker
          sumneko.lua
          tamasfe.even-better-toml
          thenuprojectcontributors.vscode-nushell-lang
          usernamehw.errorlens
          vitest.explorer
          yoavbls.pretty-ts-errors
        ])
        ++ (with extensions.vscode-marketplace-release-universal; [
          antfu.unocss
          ionutvmi.path-autocomplete
          kdl-org.kdl
          moonbit.moonbit-lang
          ryuta46.multi-command
          thang-nm.flow-icons
          typespec.typespec-vscode
          ubugeeei.vize
        ])
        ++ [ tnix ];
    };
}
