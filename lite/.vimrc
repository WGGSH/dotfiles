set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

set number
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

" set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する

set ignorecase
set smartcase
set incsearch

set list listchars=tab:\▸\-,


" ノーマルモード時だけ ; と : を入れ替える (USキー対応)
nnoremap ; :
" nnoremap : ;
