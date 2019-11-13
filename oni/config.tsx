import * as React from "react";
import * as Oni from "oni-api";

export const activate = (oni: Oni.Plugin.Api) => {
  console.log("config activated");

  // Input
  //
  // Add input bindings here:
  //
  oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"));

  //
  // Or remove the default bindings here by uncommenting the below line:
  //
  // oni.input.unbind('<c-p>')
};

export const deactivate = (oni: Oni.Plugin.Api) => {
  console.log("config deactivated");
};

export const configuration = {
  //add custom config here, such as

  "ui.colorscheme": "nord",

  // oni
  "oni.hideMenu": true,
  "oni.useDefaultConfig": false,
  //'oni.bookmarks': ['~/Documents'],
  //'oni.loadInitVim': false,

  // editor
  "editor.fontSize": "20px",
  "editor.fontFamily": "Cica",
  "editor.fontWeight": "normal",
  "editor.fullScreenOnStart": true,
  "editor.linePadding": -2,
  "editor.maximizeScreenOnStart": true,
  "editor.renderer": "WebGL",
  "editor.scrollBar.visible": true,
  "editor.quickInfo.enabled": true
  "editor.completions.mode": "native",

  // UI customizations
  "ui.animations.enabled": true,
  "ui.fontSmoothing": "auto",
  "ui.fontFamily": "Cica",

  // statusbar
  "statusbar.enabled": true,
  "statusbar.fontSize": "1.0em",

  // tabs
  "tabs.mode": "buffer",
  "tabs.height": "1.4em",
  "tabs.highlight": true,
  "tabs.showIndex": false,

  // sidebar
  "sidebar.enabled": true,
  "sidebar.width": "15em",
  "sidebar.default.open": false,

  // browser
  "browser.defaultUrl": "google.com",

  // colors
  // "colors.editor.background": "white",
  // "colors.editor.foreground": "white",
  // "colors.highlight.mode.insert.background": "white",
  // "colors.highlight.mode.insert.foreground": "white",
  // "colors.highlight.mode.normal.background": "white",
  // "colors.highlight.mode.normal.foreground": "white",
  // "colors.highlight.mode.visual.background": "white",
  // "colors.highlight.mode.visual.foreground": "white",
  // "colors.highlight.mode.operator.background": "white",
  // "colors.highlight.mode.operator.foreground": "white",


  "colors.tabs.background": "rgba(95,178,235,0.7)",
  "colors.tabs.foreground": "white",
  "colors.tabs.borderBottom": "rgba(95,178,235,0.7)",
  "colors.tabs.active.background": "rgba(95,178,235,0.7)",
  // "colors.tabs.active.foreground": white",

  // "colors.scrollbar.track": "white",
  // "colors.scrollbar.thumb": "white",
  // "colors.scrollbar.thumb.hover": "white",

  // "colors.toolTip.background": "white",
  // "colors.toolTip.foreground": "white",
  // "colors.toolTip.border": "white",

  // "colors.editor.hover.title.background": "white",
  // "colors.editor.hover.title.foreground": "white",
  // "colors.editor.hover.border": "white",
  // "colors.editor.hover.contents.background": "white",
  // "colors.editor.hover.contents.foreground": "white",
  // "colors.editor.hover.contents.codeblock.background": "white",
  // "colors.editor.hover.contents.codeblock.foreground": "white"

  // "colors.contextMenu.background": "white",
  // "colors.contextMenu.foreground": "white",
  // "colors.contextMenu.border": "white",
  // "colors.contextMenu.highlight": "white",

  "colors.menu.background": "rgba(48,89,117,1.0)",
  "colors.menu.foreground": "white",
  // "colors.menu.border": "black",
  // "colors.menu.highlight": "black",

  // "colors.sidebar.background": "white",
  // "colors.sidebar.foreground": "white",
  // "colors.sidebar.active.background": "white",
  // "colors.sidebar.selection.border": "white",

  // "colors.statusBar.background": "white",
  // "colors.statusBar.foreground": "white",

  // "colors.title.background": "white",
  // "colors.title.foreground": "white",

  // "colors.fileExplorer.background": "white",
  // "colors.fileExplorer.foreground": "white",
  // "colors.fileExplorer.selection.background": "white",
  // "colors.fileExplorer.selection.foreground": "white",
  // "colors.fileExplorer.cursor.background": "white",
  // "colors.fileExplorer.cursor.foreground": "white",

  // "colors.editor.tokenColors": ThemeToken[]



  "autoClosingPairs.enabled": false, // Vimの拡張と干渉するので無効
  "commandline.mode": true,
};
