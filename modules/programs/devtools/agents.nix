{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:

delib.module {
  name = "programs.devtools.agents";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled = {
    home.packages = [
      pkgs.llm-agents.ccusage
      pkgs.ccsession
    ];

    programs.claude-code = {
      enable = true;
      package = pkgs.llm-agents.claude-code;

      settings = {
        model = "claude-fable-5[1m]";
        effortLevel = "high";

        language = "日本語 (Japanese)";
        outputStyle = "Japanese writing";

        permissions.defaultMode = "auto";
        skipAutoPermissionPrompt = true;

        cleanupPeriodDays = 9999;

        spinnerTipsEnabled = false;
        feedbackSurveyRate = 0;
        statusLine = {
          type = "command";
          command = "ccusage statusline";
          padding = 0;
        };
      };

      outputStyles.japanese_writing = builtins.readFile "${inputs.claude-output-styles}/japanese-writing.md";
    };
  };
}
