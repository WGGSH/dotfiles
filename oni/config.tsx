
import * as React from 'react'
import * as Oni from 'oni-api'

export const activate = (oni: Oni.Plugin.Api) => {
    console.log('config activated')

    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind('<c-enter>', () => console.log('Control+Enter was pressed'))

    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind('<c-p>')

}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log('config deactivated')
}

export const configuration = {
    //add custom config here, such as

    'ui.colorscheme': 'nord',

    //'oni.useDefaultConfig': true,
    //'oni.bookmarks': ['~/Documents'],
    //'oni.loadInitVim': false,
    'editor.fontSize': '18px',
    'editor.fontFamily': 'Roboto Mono for Powerline',
    'editor.fullScreenOnStart' : true,

    // UI customizations
    'ui.animations.enabled': true,
    'ui.fontSmoothing': 'auto',
    'ui.fontSize': '12px',
    // 'ui.colorscheme': 'molokai',
    'ui.fontFamily' : 'Roboto Mono',
    
    // statusbar
    'statusbar.enabled' : true,
    'statusbar.fontSize' : '14px',

    // tabs
    'tabs.mode' : 'tabs',
    'tabs.height' : '2.0em',

    // editor
    'editor.linePadding' : -2,
    'editor.maximizeScreenOnStart' : true,
    'editor.scrollBar.visible' : true,
    
    // sidebar
    'sidebar.enabled' : true,
    'sidebar.width' : '20em',
    
}
