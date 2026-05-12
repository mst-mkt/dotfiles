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
    "editor.glyphMargin" = false;
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

    # breadcrumbs.*
    "breadcrumbs.symbolPath" = "off";
    "breadcrumbs.icons" = false;
    "breadcrumbs.showFiles" = false;

    # diffEditor.*
    "diffEditor.renderSideBySide" = false;
    "diffEditor.experimental.showMoves" = true;
    "diffEditor.experimental.useTrueInlineView" = true;
    "diffEditor.wordWrap" = "on";

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

    # extensions.*
    "extensions.autoUpdate" = false;
    "extensions.ignoreRecommendations" = true;
    "extensions.closeExtensionDetailsOnViewChange" = true;

    # explorer.*
    "explorer.compactFolders" = false;
    "explorer.confirmDelete" = false;
    "explorer.confirmDragAndDrop" = false;
    "explorer.confirmPasteNative" = false;
    "explorer.autoReveal" = false;

    # workbench.*
    "workbench.colorTheme" = "Default Dark Modern";
    "workbench.iconTheme" = "flow-deep";
    "workbench.startupEditor" = "none";
    "workbench.tips.enabled" = false;
    "workbench.editor.wrapTabs" = true;
    "workbench.editor.enablePreview" = false;
    "workbench.editor.highlightModifiedTabs" = true;
    "workbench.editor.closeOnFileDelete" = true;
    "workbench.editor.revealIfOpen" = true;
    "workbench.editor.empty.hint" = "hidden";
    "workbench.activityBar.location" = "top";
    "workbench.activityBar.iconClickBehavior" = "focus";
    "workbench.panel.opensMaximized" = "never";
    "workbench.panel.showLabels" = false;
    "workbench.layoutControl.enabled" = false;
    "workbench.tree.indent" = 16;
    "workbench.tree.renderIndentGuides" = "always";
    "workbench.commandPalette.history" = 256;
    "workbench.commandPalette.experimental.suggestCommands" = true;

    # chat.*
    "chat.commandCenter.enabled" = false;
    "chat.experimental.offerSetup" = false;

    # git.*
    "git.openRepositoryInParentFolders" = "always";
    "git.openDiffOnClick" = false;

    # github.*
    "github.gitProtocol" = "ssh";

    # github.copilot.*
    "github.copilot.enable" = {
      "*" = true;
    };
  };
}
