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

set number
set cursorline
set showmatch
set fenc=utf-8
set nobackup
set noswapfile

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set ignorecase
set smartcase

" ノーマルモード時だけ ; と : を入れ替える (USキー対応)
nnoremap ; :
nnoremap : ;

colorscheme molokai


let g:js_indent_typescript = 1


""" deoplete
let g:python3_host_prog = 'C:\Users\naoki\AppData\Local\Programs\Python\Python37\python.exe'


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


