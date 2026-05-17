{
  delib,
  host,
  pkgs,
  ...
}:

delib.module {
  name = "programs.agents";

  options = delib.singleEnableOption host.agentsFeatured;

  home.ifEnabled.home.packages = with pkgs.llm-agents; [
    # agents
    claude-code
    codex
    copilot-cli

    # utilities
    ccusage
  ];
}
