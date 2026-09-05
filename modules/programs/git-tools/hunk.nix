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
  name = "programs.git-tools.hunk";

  options = delib.singleEnableOption (host.cliFeatured && host.devFeatured && !host.isMobile);

  home.always.imports = [ inputs.hunk.homeManagerModules.hunk ];

  home.ifEnabled.programs.hunk = {
    enable = true;
    package = llm-agents.hunk;

    settings = {
      theme = "github-dark-high-contrast";
      transparent_background = true;
      menu_bar = false;
      tab_width = 2;
      wrap_lines = true;
      color_moved = true;
      agent_notes = true;
      watch = true;
      prompt_save_view_preferences = false;
    };
  };
}
