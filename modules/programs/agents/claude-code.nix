{
  delib,
  host,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  llm-agents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
  herdr-hook-script = "${llm-agents.herdr}/share/herdr/integrations/claude/herdr-agent-state.sh";

  herdr-hook = pkgs.writeShellApplication {
    name = "claude-herdr-agent-state";
    runtimeInputs = [ pkgs.python3Minimal ];
    text = ''exec sh ${herdr-hook-script} "$@"'';
  };
in

delib.module {
  name = "programs.agents.claude-code";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.programs.claude-code = {
    enable = true;
    package = llm-agents.claude-code;

    settings = {
      model = "claude-opus-5-5[1m]";
      effortLevel = "high";

      language = "日本語 (Japanese)";
      outputStyle = "Japanese writing";

      permissions.defaultMode = "auto";
      skipAutoPermissionPrompt = true;

      cleanupPeriodDays = 9999;
      autoMemoryEnabled = false;

      attribution = {
        commit = lib.mkIf host.isPersonal "";
        pr = "";
        sessionUrl = false;
      };

      tui = "fullscreen";
      spinnerTipsEnabled = false;
      feedbackDrafts = "off";
      awaySummaryEnabled = false;
      statusLine = {
        type = "command";
        command = "ccusage statusline";
        padding = 0;
      };

      env = {
        CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY = "1";
        CLAUDE_CODE_THRIFTY_SONIC = "false";
        CLAUDE_CODE_ENABLE_CFC = "false";
      };

      hooks = {
        SessionStart = [
          {
            matcher = "*";
            hooks = [
              {
                type = "command";
                command = "${lib.getExe herdr-hook} session";
                timeout = 10;
              }
            ];
          }
        ];
      };
    };

    hooks = {
      "herdr-agent-state.sh" = herdr-hook-script;
    };

    mcpServers = {
      nushell = {
        command = lib.getExe pkgs.nushell;
        args = [ "--mcp" ];
        env.GIT_EDITOR = "true";
      };
    };

    outputStyles.japanese_writing = builtins.readFile "${inputs.claude-output-styles}/japanese-writing.md";
  };
}
