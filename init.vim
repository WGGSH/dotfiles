" init.vim

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double


" コンフィグディレクトリ
let g:win_config_dir    = expand("~\\AppData\\Local\\nvim")
let g:unix_config_dir   = expand("~/.config/nvim")

" -------- dein script --------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  if has('win32') || has('win64')
    let s:toml      = g:win_config_dir. '\\dein.toml'
    let s:lazy_toml = g:win_config_dir . '\\dein_lazy.toml'
  else
    let s:toml      = g:unix_config_dir. '/dein.toml'
    let s:lazy_toml = g:unix_config_dir . '/dein_lazy.toml'
  endif

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

" -------- end dein script --------

if has('win32')
  set sh=powershell
elseif has('mac')
elseif has('unix')
endif

set number
set relativenumber
set cursorline
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
set wildignorecase
set wildmode=full

set mouse=a

set list listchars=tab:\▸\-, " タブ文字は普段使わないので目立つようにする

" ノーマルモード時だけ ; と : を入れ替える (USキー対応)
nnoremap ; :
nnoremap : ;


" Escキーを2回押すとハイライトを消す
nnoremap <ESC><ESC> :nohl<CR>

" Ctrl+Shift+Vでペースト
noremap! <C-S-v> <C-R>+

" terminal mode でEscキーを押すと normal mode に戻る
tnoremap <silent> <ESC> <C-\><C-n>

" クリップボードを有効化?
set clipboard+=unnamedplus

" wsl→winのクリップボードにコピーする
" tmux で上手く動かなさそうなので一旦保留
" if executable('win32yank.exe')
"   augroup Yank
"     autocmd!
"     autocmd TextYankPost * :call system('win32yank.exe -i', @")
"   augroup END
" endif

" Pythonのパス指定
" バージョン書きたくないと思いつつも，いいやり方が浮かばない
if has('win32') || has('win64')
  let g:python3_host_prog = 'C:\Program Files\download\python37\python.exe'
  let g:python_host_prog = 'C:\Program Files\download\Python27\python.exe'
elseif has('mac')
elseif has('unix')
  let g:python3_host_prog = '/usr/bin/python3.6'
endif

" Dvorak配列用設定
nnoremap d h
nnoremap h gj
nnoremap t gk
nnoremap n l
nnoremap e d
nnoremap ee dd
nnoremap r n
nnoremap R N

" nnoremap <C-w>d <C-w>h
nnoremap <C-w>h <C-w>j
nnoremap <C-w>t <C-w>k
" nnoremap <C-w>n <C-w>l

nnoremap <Space>d <C-w>h
" nnoremap <Space>h <C-w>j
" nnoremap <Space>t <C-w>k
nnoremap <Space>n <C-w>l

vnoremap d h
vnoremap h j
vnoremap t k
vnoremap n l
vnoremap e d
vnoremap ee dd
vnoremap r n
vnoremap R N

nnoremap <Space>s :w<CR>
nnoremap <Space>w :bw<CR>
nnoremap <Space>q :q<CR>
nnoremap <Space>- :sp<CR>
nnoremap <Space>\ :vs<CR>

" カラーテーマ
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=light

" 下線表示: カラーテーマよりも後に呼ぶ
highlight CursorLine gui=underline guifg=NONE guibg=NONE

" 透過設定
set pumblend=20
set winblend=20

" 言語別のインデント設定
augroup MyFileTypeEvent
  autocmd!
  autocmd FileType perl setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

" 最後に編集した箇所から開くようにする
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

" OniVim用の設定
if exists("g:gui_oni")
  if has('win32')
    if filereadable(expand(g:win_config_dir .'\\oni\\config.vim'))
      source ~/AppData/Local/nvim/oni/config.vim
    endif
  endif
  if has('mac')
    if filereadable(expand(g:unix_config_dir . '/oni/config.vim'))
      source ~/.config/nvim/oni/config.vim
    endif
  endif
endif

" 背景透過設定 (Winのみ)
if has('win32') || has('win64')
  " highlight Normal ctermbg=none guibg=#272822
  highlight Normal ctermbg=none guibg=none
  highlight NonText ctermbg=none guibg=none
  " highlight Folded ctermbg=none guibg=none
  " highlight EndOfBuffer ctermbg=white guibg=none
  " highlight Normal ctermbg=none guibg=none
  " highlight NonText ctermbg=none guibg=none
  " highlight Folded ctermbg=none guibg=none
  " highlight EndOfBuffer ctermbg=white guibg=none
endif

colorscheme monokai
set background=dark

" 行番号の色を変える
highlight LineNr guibg = none
highlight LineNr guifg = #428896
highlight CursorLineNr guifg = #FF8700

let g:deoplete#enable_at_startup = 1
