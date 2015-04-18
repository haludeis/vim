" File ~/.vim/main.vim
" Global settings for all files (but may be overridden in ftplugin).
let mapleader = ","
set exrc

"
" " Be smart when using tabs ;)
set smarttab

" Use spaces instead of tabs
"set expandtab
"nb space for tab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab 
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set secure
set colorcolumn=80

" Show line number
set nu

" " Enable syntax highlighting
syntax enable
"
" " Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencoding=utf-8

set nocp
syn on
set showmatch
set incsearch
set nocompatible
set showmode
set ruler
set showcmd
set hlsearch
set nohls
set cursorline

let &path.="src/include,"
set cino=g1s,h1s,f0,p0,t0,+0,(0,
"set cino=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+0,(0,u0,w1,m1 



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                Fichier swap                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set dir=~/.vim/fswap

"vire le menu sous gvim etc...
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Airline                                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" " Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" " Returns true if paste mode is enabled
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	en
	return ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Chargement type fichiers                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.hpp,*.cpp,*tpp set filetype=cpp.doxygen
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Undo persistant                                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undodir=~/.vim/temp_dirs/undodir
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Touches de fonction F1....F12                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F1 laisser libre

" F2
" Sauvegarde rapide de tout les fchiers
map <F2> :wa<CR>
imap <F2> <ESC>:wa<CR>

" F3
"reindente
imap <silent> <F3> <ESC>ggVG=<CR>
set smartindent
"set cindent
map <silent> <F3> ggVG=<CR>

" F4
" affiche/enleve la barre de menu
map <silent> <F4> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
imap <silent> <F4> <ESC>:if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" F5
" Compile
nnoremap <F5> :make<cr>
set makeprg=make\ -C\ /home/code/git/dbtx-code/build\ -j2

" F6
" lance le prog
nnoremap <F6> :!/home/code/git/sekhmet/bin/Debug/sekhmet_0.1.1d.bin --gui<cr>

" F7
" switch header cpp
nnoremap <F7> :A<cr>

" F8
" affiche/enleve le menu des classes
nnoremap <silent> <F8> :TlistToggle<CR>
"nnoremap <silent> <F8> :TagbarToggle<CR>

" F9
" affiche/enleve les parentese couleur
nnoremap <silent> <F9> :RainbowToggle<CR>



" F11
" " affiche/enleve le menu Nerdtree
nnoremap <silent> <F11> :NERDTreeToggle<CR>


" " F12
nmap <F12> :BufExplorer<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Pluggins                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle setup
" required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
"
" original repos on github
Plugin 'Shougo/neocomplcache'
"Plugin 'Shougo/neocomplete' " vim with lua

Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'spf13/vim-autoclose'
let g:autoclose_vim_commentmode = 1
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'

Plugin 'vim-scripts/a.vim'
"Plugin 'rhysd/vim-clang-format'
Plugin 'noah/vim256-color'
"Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'tpope/vim-sensible'
Plugin 'luochen1990/rainbow'
Plugin 'altercation/vim-colors-solarized'
Plugin 'honza/vim-snippets'
Plugin 'othree/html5.vim'
Plugin 'klen/python-mode'
" Permet le déplacement rapide dans le code
Plugin 'Lokaltog/vim-easymotion'
Plugin 'aperezdc/vim-template'
Plugin 'amiorin/vim-project'


" Gif config
" EasyMotion
"let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
"Rainbow

"let g:rainbow_active = 1
let g:rainbow_conf = {
			\   'guifgs': ['royalblue3', 'darkorange3', 'darkorchid3', 'seagreen3'],
			\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
			\   'operators': '_::_' ,  
			\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
			\   'separately': {
			\       '*': {},
			\       'tex': {
			\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
			\       },
			\       'lisp': {
			\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
			\       },
			\       'vim': {
			\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
			\       },
			\       'html': {
			\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
			\       },
			\       'css': 0,
			\   }
			\}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Returns true if paste mode is enabled

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Configuration Pluggins                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""Neosnippet
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"""Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""Autocompl

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
	let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Raccourci                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sélectionner tout
map <Leader>a ggVG

" Copier
map <Leader>c "+y

" Couper
map <Leader>x "+x

" Coller
map <Leader>v "+gP


map <Leader>t :set list <CR>
map <Leader>nt :set list! <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Themes                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set t_Co=256
if has("gui_running")
	"set bg=dark
	set listchars=tab:>-,trail:- " highlight tabs and trailing spaces
	"set list

	"    colorscheme blackboard
	"colorscheme asmanian_blood
	"colorscheme solarized
	"colorscheme jellybeans
	"colorscheme twilight
	colorscheme molokai
	"colorscheme fu
	"colorscheme desert
	"colorscheme 256-jungle
	"colorscheme asmanian2
	"colorscheme slate
else
	"colorscheme desert
	colorscheme molokai
	"colorscheme 256-jungle
	"colorscheme asmanian2
endif

map 2h :w<CR>:!echo "<head><meta charset=\"UTF-8\">" > /tmp/apercu.html;markdown "%" >> /tmp/apercu.html ; cd ~ ; surf "file:///tmp/apercu.html" <CR>
" Git raccourci
map <Leader>gs :Gstatus <CR>
map <Leader>gpu :Gpush<CR>
map <Leader>gpl :Gpull<CR>
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" vim-project
let g:project_use_nerdtree = 1
set rtp+=~/.vim/bundle/vim-project/
call project#rc("/home/data/git/")

Project  'bitbucket/blocnote'					, 'blocnote'	
File     'bitbucket/blocnote/session.vim'       , 'session'
Callback 'session'                              , 'Opensession'

function! Opensession(...) abort
  so /home/data/git/bitbucket/blocnote/session.vim
endfunction

Project  'bitbucket/doc'
"File     'bitbucket/doc/article-site/vim.html'            , 'vim'

Project  '~/.vim/'            , 'vimrc'

