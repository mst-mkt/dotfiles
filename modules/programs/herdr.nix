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
  name = "programs.herdr";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled = {
    programs.herdr = {
      enable = true;
      package = llm-agents.herdr;

      settings = {
        onboarding = false;

        update = {
          version_check = false;
        };

        ui = {
          prompt_new_tab_name = false;
          show_agent_labels_on_pane_borders = true;
          hide_tab_bar_when_single_tab = true;
          toast.clipboard.enabled = false;
        };

        experimental = {
          kitty_graphics = true;
          pane_history = true;
        };
      };
    };
  };
}
