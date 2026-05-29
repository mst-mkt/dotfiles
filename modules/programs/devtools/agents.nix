{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.devtools.agents";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.home.packages = with pkgs.llm-agents; [
    # agents
    claude-code
    copilot-cli

    # utilities
    ccusage
  ];
}
