if exists ('g:fvim_loaded')
  set guifont=Cica:h21.5
  FVimUIPopupMenu v:false
  FVimCustomTitleBar v:false
  " let g:airline#extensions#tabline#left_sep = ''
  let g:airline_left_sep = ''
  " FVimBackgroundComposition 'acrylic'
  FVimBackgroundComposition 'none'
  FVimBackgroundOpacity 0.85
  FVimBackgroundAltOpacity 0.85
  highlight Comment guifg = #a0a0a0
  FVimFontLineHeight '+0.0'
  nnoremap <C-=> :set guifont=+<CR>
  nnoremap <C--> :set guifont=-<CR>
  nnoremap <C-0> :set guifont=RobotoMono\ Nerd\ Font:h21.5<CR>
  nnoremap <A-CR> :FVimToggleFullScreen<CR>
  set nocursorline
  colorscheme monokai
  AirlineTheme darkspace

else "nvim-qt

  " set guioptions-=e

  if exists("g:gui_oni")
    let g:airline_theme = 'behelit'
  endif

  " let g:defoultFontFamily='Cica'
  let g:defoultFontFamily='HackGen35Nerd Console'
  let g:defaultFontSize=14

  execute 'GuiFont! ' . g:defoultFontFamily . ':h' . g:defaultFontSize
  set mouse=a
  set showtabline=2
  GuiPopupmenu 0
  GuiLinespace -2
  if exists(':GuiTabline') == 2
    " echo 'hoge'
    GuiTabline 0
  endif


  " call GuiWindowFullscreen(1)

  " let g:fontSize = substitute(g:GuiFont, '^.*:h', '','')
  " let g:fontSize+=1
  " " echo g:fontSize
  " let g:newFont = substitute(g:GuiFont, ':h\([^:]*\)', ':h'.g:fontSize,'')
  " " echo g:newFont
  " GuiFont!  g:newFont

  function! SetFont(font) abort
    execute 'GuiFont! ' . a:font
  endfunction

  function! FontSizePlus() abort
    let l:fontSize = substitute(g:GuiFont, '^.*:h', '', '')
    let l:fontSize += 1
    let l:newFont = substitute(g:GuiFont, ':h\([^:]*\)', ':h'.l:fontSize, '')
    call SetFont(l:newFont)
  endfunction

  function! FontSizeMinus() abort
    let l:fontSize = substitute(g:GuiFont, '^.*:h', '', '')
    let l:fontSize -= 1
    let l:newFont = substitute(g:GuiFont, ':h\([^:]*\)', ':h'.l:fontSize, '')
    call SetFont(l:newFont)
  endfunction

  function! FontSizeReset() abort
    let l:fontSize = g:defaultFontSize
    let l:newFont = substitute(g:GuiFont, ':h\([^:]*\)', ':h'.l:fontSize, '')
    call SetFont(l:newFont)
  endfunction


  nnoremap <C-=> :call FontSizePlus()<CR>
  nnoremap <C--> :call FontSizeMinus()<CR>
  nnoremap <C-0> :call FontSizeReset()<CR>

  " highlight LspErrorHighlight none
  " highlight LspErrorHighlight gui=undercurl guisp=red
  execute 'highlight LspErrorHighlight gui=undercurl guisp=' .g:material_color_red.gui
  " highlight LspWarningHighlight gui=none guifg=none guibg=none guisp=none
  " highlight LspWarningHighlight gui=undercurl guisp=g:material_color_orange.gui
  execute 'highlight LspWarningHighlight gui=undercurl guisp=' .g:material_color_orange.gui
endif
