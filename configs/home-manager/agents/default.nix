{ pkgs, ... }:

{
  home.packages = with pkgs.llm-agents; [
    # coding agents
    claude-code
    codex
    copilot-cli

    # agents usage
    ccusage
  ];
}
