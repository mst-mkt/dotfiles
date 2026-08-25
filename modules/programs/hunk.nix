{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:

let
  llm-agents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
in

delib.module {
  name = "programs.hunk";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured);

  home.always.imports = [ inputs.hunk.homeManagerModules.hunk ];

  home.ifEnabled.programs.hunk = {
    enable = true;
    package = llm-agents.hunk;
    enableGitIntegration = true;

    settings = {
      theme = "github-dark-high-contrast";
      transparent_background = true;
      menu_bar = false;
      tab_width = 2;
      color_moved = true;
      agent_notes = true;
      watch = true;
      prompt_save_view_preferences = false;
    };
  };
}
