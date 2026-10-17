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

  home.ifEnabled = {
    programs.claude-code = {
      enable = true;
      package = llm-agents.claude-code;

      settings = {
        model = "claude-opus-5-5[1m]";
        effortLevel = "high";

        language = "日本語 (Japanese)";
        outputStyle = "Japanese writing";

        permissions = {
          defaultMode = "auto";
          ask = [
            "Bash(gh issue create *)"
            "Bash(gh issue comment *)"
            "Bash(gh issue edit *)"
            "Bash(gh issue close *)"
            "Bash(gh issue reopen *)"
            "Bash(gh pr create *)"
            "Bash(gh pr comment *)"
            "Bash(gh pr review *)"
            "Bash(gh pr edit *)"
            "Bash(gh pr merge *)"
            "Bash(gh pr close *)"
            "Bash(gh pr reopen *)"
            "Bash(gh api * -X*)"
            "Bash(gh api * --method*)"
            "Bash(gh api *repos/* -f *)"
            "Bash(gh api *repos/* -F *)"
            "Bash(gh api *repos/* --field *)"
            "Bash(gh api *repos/* --raw-field *)"
            "Bash(gh api *repos/* --input *)"
            "Bash(gh api graphql *mutation*)"
          ];
        };
        skipAutoPermissionPrompt = true;

        cleanupPeriodDays = 9999;
        autoMemoryEnabled = false;
        disableClaudeAiConnectors = true;

        attribution = {
          commit = lib.mkIf host.isPersonal "";
          pr = "";
          sessionUrl = false;
        };

        tui = "fullscreen";
        spinnerTipsEnabled = false;
        feedbackDrafts = "off";
        awaySummaryEnabled = false;

        env = {
          CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY = "1";
          CLAUDE_CODE_THRIFTY_SONIC = "false";
          CLAUDE_CODE_ENABLE_CFC = "false";
          ENABLE_TOOL_SEARCH = "auto";
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
          env = {
            GIT_EDITOR = "true";
          };
        };
      };

      outputStyles = {
        japanese_writing = builtins.readFile "${inputs.claude-output-styles}/japanese-writing.md";
      };
    };
  };
}
