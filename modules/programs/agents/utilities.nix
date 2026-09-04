{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:

let
  llm-agents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
  ccsession = inputs.ccsession.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.agents.utilities";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.home.packages = [
    llm-agents.ccusage
    ccsession.default
  ];
}
