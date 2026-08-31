{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:

let
  nur-packages = inputs.nur-packages.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.git-tools.gh";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
    extensions = [
      pkgs.gh-markdown-preview
      pkgs.gh-poi
      nur-packages.gh-pr-reviews
      pkgs.gh-stack
    ];
  };
}
