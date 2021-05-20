" init.vim

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=single

" Space キーを Leader に設定
" 理由よくわかっていないが，ダブルクォート(")で記述しなければ動かなかった
" プラグインのショートカットを割り当てたいため dein の読み込みよりも先に記述する
let mapleader = "\<Space>"

" コンフィグディレクトリ
let g:win_config_dir  = expand('~\\AppData\\Local\\nvim')
let g:unix_config_dir = expand('~/.config/nvim')

" -------- dein script --------
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')

  " Required:
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  if has('win32') || has('win64')
    let s:toml = g:win_config_dir. '\\dein.toml'
  else
    let s:toml = g:unix_config_dir. '/dein.toml'
  endif

  call dein#load_toml(s:toml, {'lazy': 0})

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

" -------- end dein script --------

" 基本的設定
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


" Python のパス指定
" バージョン書きたくないと思いつつも，いいやり方が浮かばない
if has('win32') || has('win64')
  " let g:python3_host_prog = 'C:\Program Files\download\python37\python.exe'
  let g:python3_host_prog = 'C:\Users\naoki\AppData\Local\Programs\Python\Python37\python.exe'
  let g:python_host_prog = 'C:\Program Files\download\Python27\python.exe'
elseif has('mac')
elseif has('unix')
  let g:python3_host_prog = '/usr/bin/python3'
  let g:python_host_prog = '/usr/bin/python2'
endif


" Dvorak配列用設定
nnoremap e a
nnoremap d h
nnoremap h gj
nnoremap t gk
nnoremap n l
nnoremap a d
nnoremap aa dd
nnoremap r n
nnoremap R N

" nnoremap <C-w>d <C-w>h
nnoremap <C-w>h <C-w>j
nnoremap <C-w>t <C-w>k
" nnoremap <C-w>n <C-w>l

nnoremap <Leader><Leader>d <C-w>h
" nnoremap <Leader><Leader>h <C-w>j
" nnoremap <Leader><Leader>t <C-w>k
nnoremap <Leader><Leader>n <C-w>l

vnoremap d h
vnoremap h j
vnoremap t k
vnoremap n l
vnoremap a d
vnoremap aa dd
vnoremap r n
vnoremap R N

" Leader を使用したショートカット
nnoremap <Leader>s :w<CR>
nnoremap <Leader>w :bw<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>z :vs<CR>

" カラーテーマ
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
" set background=light

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

" colorscheme neodark
colorscheme material

" カラースキームに合わせて色のリンクを作成する
highlight CursorLineNr none
highlight link CursorLineNr function

"highlight Folded ctermbg=none guibg=none
"highlight EndOfBuffer ctermbg=white guibg=none
"highlight Normal ctermbg=none guibg=none
"highlight NonText ctermbg=none guibg=none
"highlight Folded ctermbg=none guibg=none
"highlight EndOfBuffer ctermbg=white guibg=none
"highlight SignColumn ctermbg=none guibg = none
"highlight GitGutterAdd ctermbg=none guibg=none

" 下線表示: カラーテーマよりも後に呼ぶ
" goneovim でバグが有り， guibg を背景色と同一か透明にすると下線が残るため，背景色から僅かにずらす
highlight CursorLine gui=underline guifg=none guibg=#212122


" スクロールバー
" https://qiita.com/1007/items/f2308fd3203a34422fb3
func! STL()
  let barWidth = &columns / 10
  let barWidth = barWidth < 3 ? 3 : barWidth
  let n = line('$') > 1 ? line('$') - 1 : line('$')
  let buf_top    = (line('w0') - 1) * (barWidth - 1) / n
  let buf_bottom = (line('w$')    ) * (barWidth - 1) / n
  let cursor     = (line('.')  - 1) * (barWidth - 1) / n
  let n1 = buf_top
  let n2 = cursor - n1
  let n2 = n1 + n2 >= barWidth ? barWidth - n1 - 1 : n2
  let n3 = buf_bottom - cursor
  let n3 = n1 + n2 + n3 >= barWidth ? barWidth - n1 - n2 - 1 : n3
  let n4 = barWidth - n1 - n2 - n3 - 1
  let bar = '['.repeat(' ', n1).repeat('━', n2).'❚'.repeat('━', n3).repeat(' ', n4).']'
  let stl_left = ' '
  return stl_left.bar
endfunc

" LSP のハイライト表示
" highlight LspErrorHighlight       gui=underline guifg=#DC657D guibg=none
highlight link LspErrorHighlight Error
highlight link LspWarningHighlight Exception
highlight LspInformationHighlight none
highlight LspHintHighlight none

" highlight link LspErrorVirtualText Error;
" highlight LspErrorVirtualText   gui=none guifg=darkred guibg=none
" highlight LspWarningVirtualText gui=none guifg=darkyellow guibg=none
highlight link LspInformationVirtualText Comment
highlight link LspHintVirtualText Comment

" dein.toml ファイルを開いた際に hook 部分を 正しくハイライトする
augroup tomlSyntax
    autocmd!
augroup END

autocmd tomlSyntax BufNewFile,BufRead dein*.toml call s:syntax_range_dein()

function! s:syntax_range_dein() abort
  let start = '^\s*hook_\%('.
  \           'add\|source\|post_source\|post_update'.
  \           '\)\s*=\s*%s'

  call SyntaxRange#Include(printf(start, "'''"), "'''", 'vim', '')
  call SyntaxRange#Include(printf(start, '"""'), '"""', 'vim', '')
endfunction
