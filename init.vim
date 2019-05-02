" dein script
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
	if has('win32')
  	let g:rc_dir    = expand("~\\AppData\\Local\\nvim")
    let s:toml      = g:rc_dir . '\\dein.toml'
    let s:lazy_toml = g:rc_dir . '\\dein_lazy.toml'
	else
		let g:rc_dir = expand("~/.config/nvim")
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  endif


  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" end dein script

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

if has('win32')
  set sh=powershell
  if exists("g:gui_oni")
    set number
    set cursorline
  endif
else
  set number
  set cursorline
endif
set showmatch
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する

set ignorecase
set smartcase
set incsearch

set list listchars=tab:\▸\-,


" ノーマルモード時だけ ; と : を入れ替える (USキー対応)
nnoremap ; :
nnoremap : ;

" Ctrl+BackSpaceで手前の単語を削除
inoremap <C-BS> <C-W>
" Ctrl+Deleteで選択中の単語を削除
inoremap <C-DEL> <C-o>ciw

" Escキーを2回押すとハイライトを消す
nnoremap <ESC><ESC> :nohl<CR>

"nnoremap <M-PageUp> :tabp
"ccnnoremap <M-PageDown> :tabn

" Ctrl+Shift+Vでペースト
noremap! <C-S-v> <C-R>+

" terminal mode でEscキーを押すと normal mode に戻る
tnoremap <silent> <ESC> <C-\><C-n>

" クリップボードを有効化
" Ubuntuの場合 '$ sudo apt-get install xsel'が必要
set clipboard+=unnamedplus

" カラースキームの設定（ダウンロードが必要）
colorscheme molokai


let g:js_indent_typescript = 1

let g:deoplete#enable_at_startup = 1


""" Pythonのパス指定
if has('win32')
  let g:python3_host_prog = 'C:\Users\naoki\AppData\Local\Programs\Python\Python37\python.exe'
  let g:python_host_prog = 'C:\Program Files\download\Python27\python.exe'
endif


""" markdown {{{
  autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
  autocmd BufRead,BufNewFile *.md  set filetype=markdown
  " Need: kannokanno/previm
  nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー
  inoremap <silent> <C-p> :PrevimOpen<CR> 
  " 自動で折りたたまないようにする
  let g:vim_markdown_folding_disabled=1
  let g:previm_enable_realtime = 1
" }}}


" lightline
let g:lightline = {
     \ 'colorscheme': 'landscape',
     \ 'component': {
     \   'readonly': '%{&readonly?"x":""}',
     \ },
     \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
     \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
     \ }

" C++のファイル編集時に補完機能を有効にする
augroup deoplete_clang
  autocmd!
  autocmd BufRead,BufNewFile *.cpp call dein#update() call deoplete#custom#var('clangx', 'clang_binary', '/usr/local/bin/clang') call deoplete#custom#var('clangx', 'default_c_options', '') call deoplete#custom#var('clangx', 'default_cpp_options', '')
augroup END

" ファイル名指定なしで起動した場合にNERDTreeの自動起動
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:tcomment_mapleader1 = '<c-/>'

" let g:extra_whitespace_ignored_filetypes = 'defx'
nnoremap <M-e> :Defx -split=horizontal -winheight=10 -direction=botright<CR>

autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
	  " nnoremap <silent><buffer><expr> <CR>
	  " \ defx#do_action('open')
    nnoremap <silent><buffer><expr> <CR>
    \ defx#do_action('drop')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> D
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction


