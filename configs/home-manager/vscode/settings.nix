{
  programs.vscode.profiles.default.userSettings = {
    # [editor]
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

    # emmet.*
    "emmet.variables" = {
      lang = "ja";
    };
    "emmet.useInlineCompletions" = true;

    # typescript.*
    "typescript.updateImportsOnFileMove.enabled" = "always";
    "typescript.preferences.importModuleSpecifier" = "relative";
    "typescript.preferences.quoteStyle" = "single";
    "typescript.inlayHints.parameterNames.enabled" = "literals";
    "typescript.inlayHints.parameterNames.suppressWhenArgumentMatchesName" = true;
    "typescript.inlayHints.parameterTypes.enabled" = true;
    "typescript.inlayHints.variableTypes.enabled" = true;
    "typescript.inlayHints.variableTypes.suppressWhenTypeMatchesName" = true;
    "typescript.inlayHints.propertyDeclarationTypes.enabled" = true;
    "typescript.inlayHints.functionLikeReturnTypes.enabled" = true;
    "typescript.inlayHints.enumMemberValues.enabled" = true;

    # notebook.*
    "notebook.formatOnSave.enabled" = true;
    "notebook.formatOnCellExecution" = true;

    # [files, vcs]
    # files.*
    "files.eol" = "\n";
    "files.trimTrailingWhitespace" = true;
    "files.trimFinalNewlines" = true;
    "files.insertFinalNewline" = true;

    # git.*
    "git.openRepositoryInParentFolders" = "always";
    "git.openDiffOnClick" = false;

    # github.*
    "github.gitProtocol" = "ssh";

    # [ui]
    # window.*
    "window.titleBarStyle" = "custom";
    "window.customTitleBarVisibility" = "never";
    "window.menuBarVisibility" = "compact";
    "window.commandCenter" = false;
    "window.zoomLevel" = -1;
    "window.zoomPerWindow" = false;
    "window.dialogStyle" = "custom";

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
    "workbench.browser.showInTitleBar" = false;
    "workbench.tree.indent" = 16;
    "workbench.tree.renderIndentGuides" = "always";
    "workbench.commandPalette.history" = 256;
    "workbench.commandPalette.experimental.suggestCommands" = true;

    # [panels]
    # explorer.*
    "explorer.compactFolders" = false;
    "explorer.confirmDelete" = false;
    "explorer.confirmDragAndDrop" = false;
    "explorer.confirmPasteNative" = false;
    "explorer.autoReveal" = false;

    # problems.*
    "problems.defaultViewMode" = "table";

    # search.*
    "search.smartCase" = true;
    "search.showLineNumbers" = true;
    "search.defaultViewMode" = "tree";
    "search.quickOpen.includeSymbols" = true;

    # scm.*
    "scm.showActionButton" = false;

    # terminal.*
    "terminal.integrated.fontSize" = 12;
    "terminal.integrated.fontLigatures.enabled" = true;
    "terminal.integrated.cursorStyle" = "line";
    "terminal.integrated.cursorStyleInactive" = "line";
    "terminal.integrated.cursorBlinking" = true;
    "terminal.integrated.copyOnSelection" = true;

    # [system]
    # update.*
    "update.mode" = "none";
    "update.showReleaseNotes" = false;

    # extensions.*
    "extensions.autoUpdate" = false;
    "extensions.ignoreRecommendations" = true;
    "extensions.closeExtensionDetailsOnViewChange" = true;

    # [extensions]
    # chat.*
    "chat.commandCenter.enabled" = false;
    "chat.experimental.offerSetup" = false;

    # github.copilot.*
    "github.copilot.enable" = {
      "*" = true;
    };
    "github.copilot.nextEditSuggestions.enabled" = true;

    # jupyter.*
    "jupyter.askForKernelRestart" = false;
    "jupyter.interactiveWindow.textEditor.magicCommandsAsComments" = true;

    # errorLens.*
    "errorLens.enabledDiagnosticLevels" = [
      "error"
      "warning"
    ];

    # multiCommand.*
    "multiCommand.commands" = [
      {
        command = "multiCommand.restartTsServer";
        label = "TypeScript: Restart Server";
        sequence = [ "typescript.restartTsServer" ];
      }
      {
        command = "multiCommand.restartOxlint";
        label = "Oxc: Restart Oxlint Server";
        sequence = [ "oxc.restartServer" ];
      }
      {
        command = "multiCommand.restartOxfmt";
        label = "Oxc: Restart Oxfmt Server";
        sequence = [ "oxc.restartServerFormatter" ];
      }
      {
        command = "multiCommand.restartRuff";
        label = "Ruff: Restart Server";
        sequence = [ "ruff.restart" ];
      }
      {
        command = "multiCommand.restartPython";
        label = "Python: Restart Language Server";
        sequence = [ "python.analysis.restartLanguageServer" ];
      }
      {
        command = "multiCommand.restartNixIde";
        label = "Nix IDE: Restart Language Server";
        sequence = [ "nix-ide.restartLanguageServer" ];
      }
      {
        command = "multiCommand.restartCspell";
        label = "CSpell: Restart";
        sequence = [ "cSpell.restart" ];
      }
      {
        command = "multiCommand.restartExtensionHost";
        label = "Restart Extension Host";
        description = "Restart all extensions";
        sequence = [ "workbench.action.restartExtensionHost" ];
      }
    ];
  };
}
