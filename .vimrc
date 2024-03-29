" Settings {{{

" Switch syntax highlighting on, when the terminal has colors
syntax on

" Use vim, not vi api
set nocompatible

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=100

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" search configurations
" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" set smartcase
set ic

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

" Turn on line numbers
set number

" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Hide the toolbar
set guioptions-=T

" UTF encoding
set encoding=utf-8

" Autoload files that have changed outside of vim
set autoread

" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
" Use system clipboard
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" ruler|regua|régua de limite horizontal
autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
set colorcolumn=201
" }}}

" Plugins {{{
execute pathogen#infect()

" required by Pathogen Plugin Manager
filetype plugin indent on

runtime macros/matchit.vim

" habilitando o rainbow
let g:rainbow_active = 1

" o rainbow fica muito ruim no html
let g:rainbow_conf = {'separately': {'html': 0}}

" desabilitando os default mappings do bufExplorer
let g:bufExplorerDisableDefaultKeyMapping=1

"Rust Racer autocomplete tool"
let g:racer_cmd ="/Users/ninrod/code/lib/rust/racer/target/release/racer"

" bind para o plugin vim-numbertoggle
let g:NumberToggleTrigger="K"

" Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

" Theme
set background=dark
let g:solarized_bold=1
let g:solarized_underline=0
" let g:solarized_visibility="high"
" let g:solarized_contrast="high"

if !has("gui_running")
    let g:solarized_termcolors=16
else
    set guifont=Sauce\ Code\ Powerline:h16
endif

colorscheme solarized

" vim-commentary: desabilitando o double backslash
let g:commentary_map_backslash=0

" vim-signature bookmark plugin
let g:signaturemarkertexthldynamic = 1

" nerdtree configs
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:NERDTreeShowHidden=1

" CtrlP configurations
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=10

" permitir que o ctrlp reuse a janela do Scratch
let g:ctrlp_reuse_window = 'Scratch'

" CtrlP -> override <C-o> to provide options for how to open files
let g:ctrlp_arg_map = 1

" CtrlP -> files matched are ignored when expanding wildcards
set wildignore+=*/.hg/*,*/.svn/*.,*/.DS_Store,*/.idea/*,*/.tmp/*,*/target/*

""' " CtrlP -> use Ag for searching instead of VimScript. Might not work with ctrlp_show_hidden and ctrlp_custom_ignore.
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" CtrlP -> directories to ignore when fuzzy finding
let g:ctrlp_custom_ignore = '
      \\.git$\|
      \\.hg$\|
      \\.grunt$\|
      \\.sass-cache$\|
      \bower_components$\|
      \node_modules$\|
      \\.svn$
      \'

" Ag (the silver searcher)
let g:agprg = 'ag --nogroup --nocolor --column'

" Airline (status line)
let g:airline_powerline_fonts = 1

" Gist authorisation settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" vim.polyglot configs
let g:polyglot_disabled = ['rust']

" Git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

" }}}

" mappings {{{

" adicionando space como leader key
nmap <Space> <Leader>
omap <Space> <Leader>
xmap <Space> <Leader>

" mapeamento das functions keys
nnoremap <f2> :NERDTreeTabsToggle<cr>
" nnoremap <f3> :alguma coisa<cr>
nnoremap <f4> :BD<cr>

nnoremap <f5> :windo diffthis<cr>
nnoremap <f6> :diffoff!<cr>
nnoremap <f7> :diffput<cr>
nnoremap <f8> :diffget<cr>

nnoremap <f9> :diffupdate<cr>
nnoremap <f10> :SyntasticCheck<cr>
nnoremap <f11> :so $MYVIMRC<cr>
nnoremap <f12> :e $MYVIMRC<cr>

nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>r :CtrlPMRU<cr>

autocmd FileType javascript vnoremap <buffer>  <leader>= :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <leader>= :call RangeHtmlBeautify()<cr>
autocmd FileType less,css vnoremap <buffer> <leader>= :call RangeCSSBeautify()<cr>

" remapeando por causa do camelcasemotion que roubou o , por causa dos ,w
nnoremap ,, ,
xnoremap ,, ,
onoremap ,, ,

nnoremap - :ToggleBufExplorer<cr>
nnoremap <cr> :w<cr>
nnoremap + :Scratch<cr>
nnoremap & :noh<cr>
nnoremap s :Gstatus<cr>
nnoremap Q ZQ
nnoremap Z ZZ

" map <leader>w- <C-W>- " decrement height
" map <leader>w+ <C-W>+ " increment height
" map <leader>w] <C-W>_ " maximize height
" map <leader>w[ <C-W>= " equalize all windows

map <leader>h <C-W>h
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l

" abrir uma janela vertical
map <leader>v <C-W>v

" abrir uma janela horizontal
map <leader>x <C-W>s

" mostra opções para pular direto para uma janela específica
map <Leader>w :ChooseWin<cr>

" faz um cycle nas janelas abertas
nnoremap <BS> <C-W>w

" para navegar nos help files do vim
nnoremap <buffer>  ) <C-]>
nnoremap <buffer> (  <C-T>

" um atalho mais decente para o omni completion
inoremap <C-p> <C-x><C-o>

" Tabularize
" map <Leader>e :Tabularize /=<cr>
" map <Leader>c :Tabularize /:<cr>
" }}}

" Commands {{{
" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" file formats
autocmd Filetype gitcommit setlocal spell textwidth=80
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd FileType sh,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=2 expandtab

" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.spv set filetype=php
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?

" foldmethod configurations
autocmd BufRead * setlocal foldmethod=marker
set foldlevelstart=20
" autocmd BufRead * normal zM

" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()

" }}}
