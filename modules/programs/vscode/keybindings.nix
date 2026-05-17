{ delib, ... }:

delib.module {
  name = "programs.vscode";

  home.ifEnabled.programs.vscode.profiles.default.keybindings = [
    {
      key = "ctrl+r";
      command = "workbench.action.reloadWindow";
    }
    {
      key = "ctrl+shift+r";
      command = "extension.multiCommand.execute";
    }
  ];
}
