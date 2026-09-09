{
  delib,
  host,
  pkgs,
  rice,
  ...
}:

let
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
  cjkFallback = if isDarwin then "Hiragino Sans" else "Noto Sans CJK JP";
  emojiFallback = if isDarwin then "Apple Color Emoji" else "Noto Color Emoji";
  nu = "${pkgs.nushell}/bin/nu";
  shellCommand = if isDarwin then "/bin/zsh -lc '${nu} --login'" else nu;
in

delib.module {
  name = "programs.ghostty";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.programs.ghostty = {
    enable = true;
    package = if isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
    settings = {
      command = shellCommand;
      font-family = [
        "UDEV Gothic NFLG"
        cjkFallback
        "Serenity Emoji"
        emojiFallback
      ];
      font-size = 12;
      theme = rice.ghostty.theme;
      window-decoration = if isDarwin then "auto" else "none";
      window-padding-x = 8;
      window-padding-y = 8;
      window-padding-balance = true;
      window-padding-color = "extend";
      window-show-tab-bar = "never";
      resize-overlay = "never";
      cursor-style = "bar";
      mouse-hide-while-typing = true;
      copy-on-select = "clipboard";
      selection-word-chars = "\" \\t'\\\"│`|:;,()[]{}<>$　、。，．・「」『』（）【】〔〕［］｛｝〈〉《》：；？！\"";
      confirm-close-surface = false;
      macos-option-as-alt = true;
      macos-icon = "custom-style";
      macos-icon-frame = "plastic";
      macos-icon-ghost-color = "#000000";
      macos-icon-screen-color = "#ffffff";
      keybind = [
        # tabs: passed through to herdr keybinds
        "ctrl+shift+t=unbind"
        "super+t=unbind"
        "ctrl+shift+w=unbind"
        "super+w=unbind"
        "super+alt+w=unbind"
        "ctrl+tab=unbind"
        "ctrl+shift+tab=unbind"
        "ctrl+page_up=unbind"
        "ctrl+page_down=unbind"
        "super+shift+bracket_left=unbind"
        "super+shift+bracket_right=unbind"
        "ctrl+shift+arrow_left=unbind"
        "ctrl+shift+arrow_right=unbind"
        "alt+1=unbind"
        "alt+2=unbind"
        "alt+3=unbind"
        "alt+4=unbind"
        "alt+5=unbind"
        "alt+6=unbind"
        "alt+7=unbind"
        "alt+8=unbind"
        "alt+9=unbind"
        "super+1=unbind"
        "super+2=unbind"
        "super+3=unbind"
        "super+4=unbind"
        "super+5=unbind"
        "super+6=unbind"
        "super+7=unbind"
        "super+8=unbind"
        "super+9=unbind"
        "alt+digit_1=unbind"
        "alt+digit_2=unbind"
        "alt+digit_3=unbind"
        "alt+digit_4=unbind"
        "alt+digit_5=unbind"
        "alt+digit_6=unbind"
        "alt+digit_7=unbind"
        "alt+digit_8=unbind"

        # splits: passed through to herdr keybinds
        "ctrl+shift+o=unbind"
        "super+d=unbind"
        "ctrl+shift+e=unbind"
        "super+shift+d=unbind"
        "ctrl+shift+j=unbind"
        "super+shift+j=unbind"
        "ctrl+shift+enter=unbind"
        "super+shift+enter=unbind"
        "ctrl+alt+arrow_up=unbind"
        "ctrl+alt+arrow_down=unbind"
        "ctrl+alt+arrow_left=unbind"
        "ctrl+alt+arrow_right=unbind"
        "super+alt+arrow_up=unbind"
        "super+alt+arrow_down=unbind"
        "super+alt+arrow_left=unbind"
        "super+alt+arrow_right=unbind"
        "super+ctrl+[=unbind"
        "super+ctrl+]=unbind"
        "super+ctrl+shift+arrow_up=unbind"
        "super+ctrl+shift+arrow_down=unbind"
        "super+ctrl+shift+arrow_left=unbind"
        "super+ctrl+shift+arrow_right=unbind"
        "super+ctrl+equal=unbind"

        "ctrl+enter=unbind" # fullscreen: use niri keybinds (Mod+Shift+F)
        "super+enter=unbind" # fullscreen
        "super+ctrl+f=unbind" # fullscreen
        "ctrl+shift+q=unbind" # quit: use niri keybinds (Mod+Shift+Q)
        "ctrl+,=unbind" # open_config: config is managed by nix
        "super+,=unbind" # open_config: config is managed by nix
      ];
    };
  };
}
