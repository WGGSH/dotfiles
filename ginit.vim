if exists ('g:fvim_loaded')
  set guifont=Cica:h20
  FVimUIPopupMenu v:false
  FVimCustomTitleBar v:true
  let g:airline#extensions#tabline#left_sep = ''
  FVimBackgroundComposition 'acrylic'
  FVimBackgroundOpacity 0.85
  FVimBackgroundAltOpacity 0.85
  highlight Comment guifg = #a0a0a0
  FVimFontLineHeight '+0.0'
  nnoremap <C-=> :set guifont=+<CR>
  nnoremap <C--> :set guifont=-<CR>
  nnoremap <C-0> :set guifont=Cica:h20<CR>
  nnoremap <A-CR> :FVimToggleFullScreen<CR>
  set nocursorline

else "nvim-qt

  set showtabline=2
  " set guioptions-=e

  if exists("g:gui_oni")
    let g:airline_theme = 'behelit'
  endif

  Guifont! Cica:h20
  GuiPopupmenu 0
  GuiLineSpace -5
  " GuiTabLine 0
  if exists(':GuiTabline') == 2
    echo 'hoge'
    GuiTabline 0
  endif


  call GuiWindowFullscreen(1)

endif
