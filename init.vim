" dein script
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

	if has('win32') || has('win64')
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
else
endif

set number
set relativenumber
set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
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

set list listchars=tab:\▸\-, " タブ文字は普段使わないので目立つようにする


" ノーマルモード時だけ ; と : を入れ替える (USキー対応)
nnoremap ; :
nnoremap : ;

set mouse=a

" Ctrl+BackSpaceで手前の単語を削除
" inoremap <C-BS> <C-W>
" Ctrl+Deleteで選択中の単語を削除
" inoremap <C-DEL> <C-o>ciw

" Escキーを2回押すとハイライトを消す
nnoremap <ESC><ESC> :nohl<CR>

" Ctrl+Shift+Vでペースト
noremap! <C-S-v> <C-R>+

" terminal mode でEscキーを押すと normal mode に戻る
tnoremap <silent> <ESC> <C-\><C-n>

" クリップボードを有効化?
set clipboard+=unnamedplus

" カラースキームの設定（ダウンロードが必要）
colorscheme onedark

highlight Normal ctermbg=none
highlight NonText ctermbg=none
" highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

""" Pythonのパス指定
if has('win32')
  let g:python3_host_prog = 'C:\Program Files\download\python37\python.exe'
  " let g:python3_host_prog = 'C:\Users\naoki\AppData\Local\Programs\Python\Python37\python.exe'
  let g:python_host_prog = 'C:\Program Files\download\Python27\python.exe'
else
  let g:python3_host_prog = '/usr/bin/python3.6'
endif

nnoremap d h
nnoremap h j
nnoremap t k
nnoremap n l
nnoremap e d
nnoremap ee dd

nnoremap <C-w>d <C-w>h
nnoremap <C-w>h <C-w>j
nnoremap <C-w>t <C-w>k
nnoremap <C-w>n <C-w>l

vnoremap d h
vnoremap h j
vnoremap t k
vnoremap n l




set guicursor=
