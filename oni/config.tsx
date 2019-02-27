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

  "ui.colorscheme": "PerfectDark",

  "oni.useDefaultConfig": false,
  //'oni.bookmarks': ['~/Documents'],
  //'oni.loadInitVim': false,
  "editor.fontSize": "18px",
  "editor.fontFamily": "Roboto Mono for Powerline",

  // editor
  "editor.fontWeight": "normal",
  "editor.fullScreenOnStart": false,
  "editor.linePadding": -2,
  "editor.maximizeScreenOnStart": true,
  "editor.renderer": "WebGL",
	"editor.scrollBar.visible": false,

  // oni
  //"oni.hideMenu": true,

  // UI customizations
  "ui.animations.enabled": true,
  "ui.fontSmoothing": "auto",
  "ui.fontFamily": "Roboto Mono for Powerline",

  // statusbar
  "statusbar.enabled": false,
  "statusbar.fontSize": "1.0em",

  // tabs
  "tabs.mode": "tabs",
  "tabs.height": "2.0em",
	"tabs.highlight": true,


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

};
