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
  name = "programs.devtools.agents";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.always.imports = [ inputs.agent-skills.homeManagerModules.default ];

  home.ifEnabled = {
    home.packages = [
      llm-agents.ccusage
      llm-agents.herdr
      ccsession.default
    ];

    programs.claude-code = {
      enable = true;
      package = llm-agents.claude-code;

      settings = {
        model = "claude-fable-5[1m]";
        effortLevel = "high";

        language = "日本語 (Japanese)";
        outputStyle = "Japanese writing";

        permissions.defaultMode = "auto";
        skipAutoPermissionPrompt = true;

        cleanupPeriodDays = 9999;

        spinnerTipsEnabled = false;
        statusLine = {
          type = "command";
          command = "ccusage statusline";
          padding = 0;
        };

        env.CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY = "1";
      };

      outputStyles.japanese_writing = builtins.readFile "${inputs.claude-output-styles}/japanese-writing.md";
    };

    programs.agent-skills = {
      enable = true;
      sources = {
        ax = {
          path = inputs.ax.outPath;
          subdir = "skills/ax";
        };
        gh-stack = {
          path = pkgs.gh-stack.src.outPath;
          subdir = "skills/gh-stack";
        };
        git-hunk.path = pkgs.git-hunk.src.outPath;
        skills.path = inputs.skills.outPath;
      };
      skills = {
        enableAll = [ "skills" ];
        enable = [
          "ax"
          "gh-stack"
          "git-hunk"
        ];
      };
      targets.claude.enable = true;
    };
  };
}
