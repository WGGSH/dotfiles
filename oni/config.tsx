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
  "tabs.height": "2.0em",
  "tabs.highlight": true,
  "tabs.showIndex": true,

  // sidebar
  "sidebar.enabled": false,
  "sidebar.width": "20em",
  "sidebar.default.open": false,

  // browser
  "brwser.defaultUrl": "google.com",

  // colors
  "colors.tabs.background": "rgb(30,50,70)",
  "colors.tabs.foreground": "white",
  "colors.tabs.borderBottom": "rgb(34,34,34)",
  "colors.menu.background": "rgb(30,50,70)",

  "autoClosingPairs.enabled": false, // Vimの拡張と干渉すろので無効
  "commandline.mode": true,
};
