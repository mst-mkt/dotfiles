{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:

let
  llm-agents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};

  # Swap a decorative glyph to keep the display consistent across platforms.
  claude-code = llm-agents.claude-code.overrideAttrs (old: {
    bulletFrom = ''"\u23FA":"\u25CF"'';
    bulletTo = ''"\u25CF":"\u25CF"'';

    postInstall = (old.postInstall or "") + ''
      bin=$out/bin/claude
      offset=$(grep -Fabo -m1 "$bulletFrom" "$bin" | cut -d: -f1)
      printf %s "$bulletTo" | dd of="$bin" bs=1 seek="''${offset:?not found}" conv=notrunc
    '';
  });
in

delib.module {
  name = "programs.agents.claude-code";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.ifEnabled.programs.claude-code = {
    enable = true;
    package = claude-code;

    settings = {
      model = if host.name == "greenpath" then "claude-opus-4-6[1m]" else "claude-fable-5-1[1m]";
      effortLevel = "high";

      language = "日本語 (Japanese)";
      outputStyle = "Japanese writing";

      permissions.defaultMode = "auto";
      skipAutoPermissionPrompt = true;

      cleanupPeriodDays = 9999;
      autoMemoryEnabled = false;

      tui = "fullscreen";
      spinnerTipsEnabled = false;
      feedbackDrafts = "off";
      awaySummaryEnabled = false;
      statusLine = {
        type = "command";
        command = "ccusage statusline";
        padding = 0;
      };

      env.CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY = "1";
    };

    outputStyles.japanese_writing = builtins.readFile "${inputs.claude-output-styles}/japanese-writing.md";
  };
}
