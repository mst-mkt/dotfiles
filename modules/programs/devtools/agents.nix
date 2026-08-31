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
  nur-packages = inputs.nur-packages.packages.${pkgs.stdenv.hostPlatform.system};

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
  name = "programs.devtools.agents";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.always.imports = [ inputs.agent-skills.homeManagerModules.default ];

  home.ifEnabled = {
    home.packages = [
      llm-agents.ccusage
      ccsession.default
    ];

    programs.claude-code = {
      enable = true;
      package = claude-code;

      settings = {
        model = "claude-fable-5[1m]";
        effortLevel = "high";

        language = "日本語 (Japanese)";
        outputStyle = "Japanese writing";

        permissions.defaultMode = "auto";
        skipAutoPermissionPrompt = true;

        cleanupPeriodDays = 9999;

        tui = "fullscreen";
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
        git-hunk.path = nur-packages.git-hunk.src.outPath;
        herdr = {
          path = llm-agents.herdr.src.outPath;
          subdir = "skills/herdr";
        };
        hunk-review = {
          path = llm-agents.hunk.outPath;
          subdir = "skills/hunk-review";
        };
        skills.path = inputs.skills.outPath;
      };
      skills = {
        enableAll = [ "skills" ];
        enable = [
          "ax"
          "gh-stack"
          "git-hunk"
          "herdr"
          "hunk-review"
        ];
      };
      targets.claude.enable = true;
    };
  };
}
