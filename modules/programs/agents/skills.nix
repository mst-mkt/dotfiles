{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:

let
  llm-agents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
  nur-packages = inputs.nur-packages.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.agents.skills";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.always.imports = [ inputs.agent-skills.homeManagerModules.default ];

  home.ifEnabled =
    { myconfig, ... }:
    {
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
        targets = {
          claude.enable = myconfig.programs.agents.claude-code.enable;
          pi.enable = myconfig.programs.agents.pi.enable;
        };
      };
    };
}
