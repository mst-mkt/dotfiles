{
  delib,
  host,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  ax = inputs.ax.packages.${pkgs.stdenv.hostPlatform.system};
  cf-open = inputs.cf-open.packages.${pkgs.stdenv.hostPlatform.system};
  nur-packages = inputs.nur-packages.packages.${pkgs.stdenv.hostPlatform.system};
  serenity-emoji = inputs.serenity-emoji.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.cli-utilities";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.home.packages = [
    pkgs.bottom
    pkgs.ffmpeg
    pkgs.fzf
    pkgs.jnv
    pkgs.jq
    pkgs.mmv-go
    pkgs.tree
    pkgs.wget
    serenity-emoji.cli
  ]
  ++ lib.optionals host.devFeatured [
    ax.default
    cf-open.default
    nur-packages.gengo
    pkgs.mo-viewer
  ]
  ++ lib.optionals host.iniadFeatured [ nur-packages.esa-cli ]
  ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [ pkgs.wl-clipboard ];
}
