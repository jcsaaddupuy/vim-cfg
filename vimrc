" Annule la compatibilite avec l’ancetre Vi
set nocompatible

" Ajout de Vundle au runtime path et initialisation
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" On indique à Vundle de s'auto-gérer :)
Plugin 'gmarik/Vundle.vim'

Plugin 'itchyny/lightline.vim'
" snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Ctrlp
Plugin 'kien/ctrlp.vim'
" nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'

Plugin 'sjl/gundo.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/LustyExplorer'

" autocomplete etc
Plugin 'Valloric/YouCompleteMe'
Plugin 'python-rope/ropevim'
" for autocompletion with tab
Plugin 'ervandew/supertab'

Plugin 'majutsushi/tagbar'
" code formatter
Plugin 'ambv/black'

" auto complete brackets etc
Plugin 'Raimondi/delimitMate'
" display colors for hexa strings
" Plugin 'lilydjwg/colorizer'
Plugin 'chrisbra/Colorizer'

" easily comment/uncomment (leader ci)
Plugin 'scrooloose/nerdcommenter'
" Git
" git comands from vim
Plugin 'tpope/vim-fugitive'
" shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plugin 'airblade/vim-gitgutter'

Plugin 'mustache/vim-mustache-handlebars'

Plugin 'digitaltoad/vim-pug'
Plugin 'posva/vim-vue'

Plugin 'dodie/vim-disapprove-deep-indentation'

Plugin 'thiagoalessio/rainbow_levels.vim'

call vundle#end()            " Nécessaire
filetype plugin indent on    " Nécessaire




" Affichage
set title	"Mets à jour le titre de cla console
set ruler	"Affiche le numéros de lignes
set number	"Affiche les numéros de lignes
set wrap	"Affiche les lignes trop longues sur plusieurs lignes
set scrolloff=3	"Affiche un minimum de 3 lignes autour du curseur pour le scroll

"-- Recherche
set ignorecase	"Case insensitive par default pour la recherche
set smartcase	"Si une recherche contient une majuscule re-active la sensibilite a la casse

set incsearch	"Surligne les resultats de recherche pendant la
set hlsearch	"Surligne les resultats de recherche

" -- Beep
set visualbell	 "Empeche Vim de beeper
set noerrorbells "Empeche vim de beeper

" Active le comportement ’habituel’ de la touche retour en arriere
set backspace=indent,eol,start

" Cache les fichiers lors de l’ouverture d’autres fichiers
set hidden

" Active la coloration syntaxique
syntax on
" Active les comportements specifiques aux types de fichiers comme la syntaxe et l’indentation
filetype on
filetype plugin on
filetype indent on
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" Active la ligne de status
set ls=2

" Indent avec 2 espaces au lieu de tabs
set expandtab
"set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent

" relativenumbers
set relativenumber "numbers are relatives
:au FocusLost * :set number
:au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" http://stackoverflow.com/a/22253548
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"



" Activation de pathogen
call pathogen#infect()

" Les ; sons rarement utilise l’un a la suite de l’autre: remappe ;; avec la
" touche escape
imap ;; <Esc>

" touche d'activation
let mapleader = ","

" Utilise la version sombre de Solarized
" set background=dark
" colorscheme badwolf
" Enable transparent background"
let g:solarized_termtrans=1
let g:solarized_hitrail=1
let g:solarized_underline=1
let g:solarized_visibility='high'
let g:solarized_contrast='high'

set t_Co=256

" Activation de NERDTree sur un CTRL n
map <silent> <F2> :NERDTreeToggle<CR>

" Activation de taglit sur un CTRL b
map <silent> <F3> :TagbarToggle<CR>
" Agrandit la window de taglist
let Tlist_WinWidth = 50

" Desactiver les touches directionnelles
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>


"improve autocomplete menu color
hi Pmenu        cterm=none ctermfg=White     ctermbg=Black
hi PmenuSel     cterm=none ctermfg=Black     ctermbg=DarkGreen
hi PmenuSbar    cterm=none ctermfg=none      ctermbg=Green
hi PmenuThumb   cterm=none ctermfg=DarkGreen ctermbg=DarkGreen


set splitbelow
set splitright

" Save vim buffers. Note that if Vim is invoked with a filename argument, then
" the buffer list will not be restored from the last session. To use buffer
" lists across sessions, invoke Vim without passing filename arguments.
set viminfo+=%

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }


"raccourcis claviers {
set wildignore+=*/tmp/*,*.o,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*,*/htmlcov/*,*.pyc*,*/__pycache__/*
let g:ctrlp_map = '<c-p>'

"

" pythons stuffs {
" autocmd BufWritePost *.py call Flake8()
" removes trailing spaces on save against python files
" autocmd BufWritePre *.py :%s/\s\+$//e
" " plugin flake
" let g:flake8_quickfix_location="topleft"
" shortcut for autopep8
" map <F8> :! yapf --style='{based_on_style: pep8, column_limit: 99}' -i %<CR><ESC>
" map <F8> :! autopep8 --in-place --aggressive --aggressive --max-line-length 160 -i %<CR><ESC>
"
"
" Colorizer
autocmd VimEnter * ColorHighlight .
"" nerdtree config
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" let NERDTreeQuitOnOpen = 1
"
autocmd StdinReadPre * let s:std_in=1
" auto open
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"close a tab if the only remaining window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"
let NERDTreeAutoDeleteBuffer = 1
" end of nerdtree config

nnoremap <F5> :GundoToggle<CR>

" Os specifics
let os = substitute(system('uname'), "\n", "", "")
if os == "Darwin"
    " uses custom ctags for osx
    if !empty(glob("/opt/boxen/homebrew/bin/ctags"))
        let g:tagbar_ctags_bin='/opt/boxen/homebrew/bin/ctags'
    endif
elseif os == "Linux"
    " specific archlinux / python2
    if !empty(glob("/usr/bin/flake8-python2"))
        let g:flake8_cmd='/usr/bin/flake8-python2'
    endif
endif



" autocmd FileType python set ft=python.django " For SnipMate
" autocmd FileType html set ft=htmldjango.html " For SnipMate
set tw=160

inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>


" Go stuffs {
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" }
"
"

" Pytest
au FileType python nmap <silent><Leader>f <Esc>:Pytest file<CR>
au FileType python nmap <silent><Leader>c <Esc>:Pytest class<CR>
au FileType python nmap <silent><Leader>m <Esc>:Pytest method<CR>
au FileType python nmap <silent><Leader>n <Esc>:Pytest function<CR>

" black
" let g:black_linelength=140

" syntastic
let g:syntastic_python_checkers = ['flake8', ]
"let g:syntastic_python_checkers = ['pylint']
let g:syntastic_flake8_max_line_length="160"

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_enable_signs = 0
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 0

" rope
let ropevim_vim_completion=1

hi! RainbowLevel0 ctermbg=240 guibg=#585858
hi! RainbowLevel1 ctermbg=239 guibg=#4e4e4e
hi! RainbowLevel2 ctermbg=238 guibg=#444444
hi! RainbowLevel3 ctermbg=237 guibg=#3a3a3a
hi! RainbowLevel4 ctermbg=236 guibg=#303030
hi! RainbowLevel5 ctermbg=235 guibg=#262626
hi! RainbowLevel6 ctermbg=234 guibg=#1c1c1c
hi! RainbowLevel7 ctermbg=233 guibg=#121212
hi! RainbowLevel8 ctermbg=232 guibg=#080808

let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.less.pug
