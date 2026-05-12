{
  programs.vscode.profiles.default.userSettings = {
    # editor.*
    "editor.fontFamily" = "'UDEV Gothic NF', monospace";
    "editor.fontSize" = 12;
    "editor.fontLigatures" = true;
    "editor.tabSize" = 2;
    "editor.insertSpaces" = true;
    "editor.detectIndentation" = false;
    "editor.formatOnSave" = true;
    "editor.minimap.enabled" = false;
    "editor.renderWhitespace" = "all";
    "editor.rulers" = [
      80
      100
    ];
    "editor.stickyScroll.enabled" = false;
    "editor.guides.bracketPairs" = true;
    "editor.guides.bracketPairsHorizontal" = true;
    "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
    "editor.renderLineHighlight" = "gutter";
    "editor.cursorBlinking" = "phase";
    "editor.cursorStyle" = "line";
    "editor.cursorWidth" = 3;
    "editor.cursorSmoothCaretAnimation" = "explicit";
    "editor.smoothScrolling" = true;
    "editor.scrollbar.vertical" = "visible";
    "editor.scrollbar.verticalScrollbarSize" = 8;
    "editor.scrollbar.horizontalScrollbarSize" = 4;
    "editor.scrollbar.scrollByPage" = true;
    "editor.tabCompletion" = "on";
    "editor.suggest.preview" = true;
    "editor.linkedEditing" = true;
    "editor.multiCursorModifier" = "ctrlCmd";
    "editor.dragAndDrop" = false;
    "editor.copyWithSyntaxHighlighting" = false;
    "editor.wordSeparators" = "`~!@#$%^&*()-=+[{]}\\|;:'\",.<>/?_（）。、「」・　";

    # files.*
    "files.eol" = "\n";
    "files.trimTrailingWhitespace" = true;
    "files.trimFinalNewlines" = true;
    "files.insertFinalNewline" = true;

    # window.*
    "window.titleBarStyle" = "custom";
    "window.customTitleBarVisibility" = "never";
    "window.menuBarVisibility" = "compact";
    "window.commandCenter" = false;
    "window.zoomLevel" = -1;
    "window.zoomPerWindow" = false;
    "window.dialogStyle" = "custom";

    # workbench.*
    "workbench.startupEditor" = "none";
    "workbench.colorTheme" = "Default Dark Modern";
    "workbench.iconTheme" = "flow-deep";

    # github.copilot.*
    "github.copilot.enable" = {
      "*" = true;
    };
  };
}
