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

        keys = {
          prefix = "ctrl+space";
          new_tab = [
            "prefix+c"
            "ctrl+shift+t"
          ];
          close_tab = [
            "prefix+shift+x"
            "ctrl+shift+w"
          ];
          previous_tab = [
            "prefix+p"
            "ctrl+shift+tab"
          ];
          next_tab = [
            "prefix+n"
            "ctrl+tab"
          ];
          switch_tab = [
            "prefix+1..9"
            "alt+1..9"
          ];
          focus_pane_left = [
            "prefix+h"
            "ctrl+shift+h"
          ];
          focus_pane_down = [
            "prefix+j"
            "ctrl+shift+j"
          ];
          focus_pane_up = [
            "prefix+k"
            "ctrl+shift+k"
          ];
          focus_pane_right = [
            "prefix+l"
            "ctrl+shift+l"
          ];
          split_vertical = [
            "prefix+v"
            "ctrl+shift+o"
          ];
          split_horizontal = [
            "prefix+minus"
            "ctrl+shift+e"
          ];
          previous_workspace = "ctrl+shift+up";
          next_workspace = "ctrl+shift+down";
          previous_agent = "ctrl+alt+up";
          next_agent = "ctrl+alt+down";
          toggle_sidebar = [
            "prefix+b"
            "ctrl+shift+b"
          ];
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
