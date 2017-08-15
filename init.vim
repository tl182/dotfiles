scriptencoding utf-8

" Explicityly state paths for Pyenv
let g:python_host_prog = '/home/asleap/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/asleap/.pyenv/versions/neovim3/bin/python'

" Setup dein
if (!isdirectory(expand("$HOME/.config/nvim/bundle/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/bundle/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/bundle/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

let s:bundle_dir = expand('~/.config/nvim/bundle')
let s:plugin_dir = s:bundle_dir . '/repos/github.com'

if dein#load_state(s:bundle_dir)
    call dein#begin(s:bundle_dir)

    call dein#add(s:plugin_dir . '/Shougo/dein.vim')

    " Appearance, UI
    call dein#add('morhetz/gruvbox')
    call dein#add('mhinz/vim-startify')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('Yggdroot/indentLine')
    call dein#add('dominikduda/vim_current_word')
    call dein#add('mhinz/vim-signify')
    "call dein#add('Shougo/unite.vim')
    "call dein#add('Shougo/vimfiler.vim')

    " Editing
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('matze/vim-move')
    call dein#add('vim-scripts/DoxygenToolkit.vim')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('majutsushi/tagbar')
    call dein#add('sheerun/vim-polyglot')
    " call dein#add('Shougo/neopairs.vim')

    " Autocomplition, snippets
    call dein#add('Shougo/context_filetype.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('zchee/deoplete-jedi')
    call dein#add('Shougo/neco-vim')
    call dein#add('Shougo/echodoc.vim')
    call dein#add('ervandew/supertab')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('honza/vim-snippets')

    " Python
    " call dein#add('davidhalter/jedi-vim')
    call dein#add('hdima/python-syntax')

    " Go
    call dein#add('zchee/deoplete-go', {'build': 'make'})

    " File management
    call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
    call dein#add('tweekmonster/fzf-filemru')

    if dein#check_install()
        call dein#install()
        let pluginsExist=1
    endif

    call dein#end()
    call dein#save_state()
endif


" Settings
" Timeout settings
set timeoutlen=300                  " Mapping timeout
set ttimeoutlen=50                  " Keycode timeout

" Map leader keys
let maplocalleader=','
let mapleader=' '
let g:mapleader=' '


" Repeat default nvim settings
syntax on
filetype plugin indent on
set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=.,~/.local/share/nvim/backup
set belloff=all
set complete-=i
set directory=~/.local/share/nvim/swap//
set display=lastline
set formatoptions=tcqj
set history=10000
set hlsearch
set incsearch
set langnoremap
set nolangremap
set laststatus=2
set listchars="tab:> ,trail:-,nbsp:+"
set nocompatible
set nrformats=bin,hex
set ruler
set sessionoptions-=options
set showcmd
set smarttab
set tabpagemax=50
set tags=./tags;,tags
set ttyfast
set undodir=~/.local/share/nvim/undo
set viminfo+=!
set wildmenu


" Set mouse
set mouse=a
set mousehide


" Text settings
set fileencoding=utf-8              " UTF-8 on write
set expandtab                       " Use spaces instead of tabs
set tabstop=4                       " Show tabs as 4 spaces
set softtabstop=4                   " Tab key indents by 4 spaces
set shiftwidth=4                    " >> indents by 4 spaces
set shiftround                      " >> indents to the next multiple of shiftwidth


" Set listchars and show them
set list
if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:→ ,eol:↵,trail:~,extends:↷,precedes:↶,nbsp:±'
else
    let &listchars = 'tab:> ,eol:¬,trail:~,extends:>,precedes:<,nbsp:.'
endif


" Scroll settings
if !&scrolloff
    set scrolloff=6                 " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=6             " Show next 5 columns while side-scrolling.
endif


" Undo, backup, swap
set undofile
set nobackup
set swapfile


" Basic autocompletion
set completeopt=menuone,longest
set wildmenu                        " Command line completion
set wildmode=list:full
set wildignore+=*~,*.o,core.*,*.exe,.git/,.hg/,.svn/,.DS_Store,*.pyc
set wildignore+=*.swp,*.swo,*.class,*.tags,tags,tags-*,cscope.*,*.taghl
set wildignore+=.ropeproject/,__pycache__/,venv/,*.min.*,images/,img/,fonts/
set wildignorecase


" Fold options
set foldenable                      " Enable folds by default
set foldmethod=syntax               " Fold via syntax of files
set foldlevelstart=99               " Open all folds by default


" Other options
set cursorline                      " Highlight current line
set formatoptions+=o                " Continue comment markers in new line
set gdefault                        " Set global flag for search and replace
set hidden                          " Hide buffers in background
set ignorecase                      " Case insensitive search
set inccommand=nosplit              " Show effects of the command incrementally
set lazyredraw                      " Do not redraw on registers and macros
set linebreak                       " Write lines at convenient points
set modeline                        " Enable modeline
set nojoinspaces                    " Prevent inserting 2 spaces on a join (J)
set nostartofline                   " Jump to first non-blank character
set number                          " Line numbers
set numberwidth=1                   " Minimal width
" set numberwidth=5
set relativenumber                  " Relative numbering
set report=0                        " Always report changed lines
set showfulltag                     " Show tag and info in insert-mode completion
set showmatch                       " Highlight matched bracket
"set showmode                        " Show current mode
set showtabline=2                   " Always show tabline
set smartcase                       " Smart case search if there is upper
set spell                           " Enable spell check
set splitbelow                      " Split below current window
set splitright                      " Split right of the current window
set synmaxcol=200                   " Highlight 200 columns (default 3000, 0 - no limit)
set textwidth=0                     " Hard-wrap long lines as you type them
set title                           " Set terminal's title
set whichwrap+=<,>,h,l              " Allow backspace an cursor keys to cross line boundaries
set wrap                            " Enable word wrap
set wrapscan                        " Searches wrap around end of file


" Appearance
" Gruvbox
set termguicolors
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_impoved_strings=1
let g:gruvbox_improved_warnings=1
set background=dark
colorscheme gruvbox
" highlight LineNr ctermbg=brown guibg=#1d2021
" Airline
set noshowmode
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits=1
let g:airline#extensions#tabline#show_buffers=1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9
" nmap <leader>- <Plug>AirlineSelectPrevTab
" nmap <leader>+ <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnametruncate = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#default#section_truncate_width = {
            \ 'b': 79,
            \ 'x': 60,
            \ 'y': 88,
            \ 'z': 45,
            \ 'warning': 80,
            \ 'error': 80,
            \ }
let g:airline#extensions#default#layout = [
            \ [ 'a', 'error', 'warning', 'b', 'c' ],
            \ [ 'x', 'y', 'z' ]
            \ ]
let g:airline#extensions#ale#error_symbol = '•'
let g:airline#extensions#ale#warning_symbol = '•'
" Webdevicons
let g:webdevicons_enable_vimfiler=1
let g:webdevicons_enable_airline_tabline=1
let g:webdevicons_enable_airline_statusline=1
let entry_format = "'   ['. index .']'. repeat(' ', (3 - strlen(index)))"
if exists('*WebDevIconsGetFileTypeSymbol')  " support for vim-devicons
    let entry_format .= ". WebDevIconsGetFileTypeSymbol(entry_path) .' '.  entry_path"
else
    let entry_format .= '. entry_path'
endif
" Startify
let g:startify_session_dir = '~/.local/share/nvim/sessions'
let g:startify_bookmarks = ['~', '~/Desktop']
let g:startify_change_to_vcs_root = 1
let g:indentLine_char='│'
" Current word
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 1
" hi CurrentWord ctermfg=XXX ctermbg=XXX cterm=underline,bold,italic
highlight CurrentWord gui=underline cterm=underline
highlight CurrentWordTwins gui=underline cterm=underline


" Plugin configuration (:help <PluginName>)
" AutoPairs
let g:AutoPairsShortcutJump = "<M-f>"
let g:AutoPairsFlyMode = 1

" DoxygenToolkit
" :DoxLic - licence stub
" :DoxAuthor - author stub
" :Dox - class/function stub
" :DoxBlock - block stub
" :DoxUndoc(DEBUG) - undoc

" NERDCommenter
let g:NERDSpaceDelims = 1
nmap <Leader>\ <Plug>NERDCommenterToggle
vmap <Leader>\ <Plug>NERDCommenterToggle

" tagbar
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_type_go = {
\ 'ctagstype' : 'go',
\ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
\ ],
\ 'sro' : '.',
\ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
\ },
\ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
\ },
\ 'ctagsbin'  : 'gotags',
\ 'ctagsargs' : '-sort -silent'
\ }

" FZF
let $LANG = 'en_US'
" Customize fzf colors to match your color scheme
let g:fzf_colors = {
            \ 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Function'],
            \ 'fg+':     ['fg', 'String', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'Statusline', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Type'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Error'],
            \ 'marker':  ['fg', 'String'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'],
            \   }

" signify
let g:signify_vcs_list = ['git']
let g:signify_realtime = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = -1 "100
let g:deoplete#max_menu_width = -1 "50
let g:deoplete#auto_complete_delay = 100
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['around', 'member', 'tag']
let g:deoplete#sources.vim = ['vim', 'tag', 'neosnippet']
let g:deoplete#sources.python = ['jedi', 'tag', 'neosnippet']
let g:deoplete#sources.go = ['go', 'tag', 'neosnippet']
let g:deoplete#file#enable_buffer_path = 1
" call deoplete#custom#set('_', 'matchers', ['matcher_head'])
" call deoplete#custom#set('_', 'sorters', ['sorter_rank'])
" call deoplete#custom#set('_', 'converters', [
            " \ 'converter_remove_overlap',
            " \ 'converter_truncate_abbr',
            " \ 'converter_truncate_menu',
            " \ 'converter_auto_delimeter',
            " \ 'converter_auto_paren'])
call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])
" <BS>: close popup and delete backword char.
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" deoplete-jedi
let g:deoplete#sources#jedi#enable_cache = 1

" deoplete-go
let g:deoplete#sources#go#pointer = 1

" echodoc
let g:echodoc#enable_at_startup = 1

" neosnippet
imap <C-s> <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#enable_snipmate_compatibility = 1

" jedi-vim
" Use ':Pyimport <import name>' to check out import
" set completeopt=menuone,longest,noinsert,noselect
" let g:jedi#auto_initialization = 1
" let g:jedi#auto_vim_configuration = 1
" let g:jedi#completions_enabled = 1
" let g:jedi#popup_on_dot = 1
" let g:jedi#popup_select_first = 0
" let g:jedi#auto_close_doc = 1
" let g:jedi#show_call_signatures = 2
" let g:jedi#show_call_signatures_delay = 10
" let g:jedi#smart_auto_mappings = 1
" let g:jedi#use_tag_stack = 1
" let g:jedi#goto_command = "<Localleader>g"
" let g:jedi#goto_assignments_command = "<Localleader>a"
" let g:jedi#documentation_command = "<Localleader>d"
" let g:jedi#rename_command = "<Localleader>r"
" let g:jedi#usages_command = "<Localleader>u"

" python-syntax
let g:python_highlight_builtins = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_string_format = 1
let g:python_highlight_string_templates = 1
let g:python_highlight_doctests = 1
let g:python_print_as_function = 1
let g:python_highlight_file_headers_as_comments = 0

" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ['&completefunc:<C-p>',
            \'&omnifunc:<C-x><C-o>']


" Autocmds
augroup MyNvimBasic
    autocmd!

    " Speed up Syntax Highlighting
    " autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
    autocmd BufEnter * :syntax sync maxlines=200

    " Go back to previous position of cursor if any
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe 'normal! g`"zvzz' |
        \ endif

    " No syntax for big files
    autocmd BufReadPre *
        \ if getfsize(expand("%")) > 10000000 |
        \   syntax off |
        \ endif

    " Close quickfix and locationlist windows
    function! MyLastWindow()
        if &buftype ==# 'quickfix' || &buftype ==# 'locationlist'
            if winbufnr(2) == -1
                quit!
            endif
        endif
    endfunction
    autocmd BufEnter * call MyLastWindow()
augroup END

augroup MyPythonAutocmds
    autocmd!
    " Disable deoplete for python (use jedi-vim)
    " autocmd FileType python let b:deoplete_disable_auto_complete = 1
    autocmd FileType python setlocal
                    \ foldmethod=indent
                    \ tabstop=4
                    \ shiftwidth=4
                    \ softtabstop=4
                    \ textwidth=79
                    \ expandtab
                    \ autoindent
                    \ fileformat=unix
    " autocmd FileType python setlocal completeopt=menuone,longest,preview
    " autocmd FileType python setlocal omnifunc=jedi#completions
    " autocmd FileType python call jedi#configure_call_signatures()

    " autocmd FileType python inoremap <silent> <buffer> <C-Space> <C-x><C-o>
    " autocmd FileType python imap <buffer> <Nul> <C-Space>
    " autocmd FileType python smap <buffer> <Nul> <C-Space>

    " autocmd FileType python nnoremap <silent> <buffer> <Localleader>g :call jedi#goto()<CR>
    " autocmd FileType python nnoremap <silent> <buffer> <Localleader>a :call jedi#goto_assignments()<CR>
    " autocmd FileType python nnoremap <silent> <buffer> <Localleader>d :call jedi#show_documentation()<CR>
    " autocmd FileType python nnoremap <silent> <buffer> <Localleader>r :call jedi#rename()<CR>
    " autocmd FileType python nnoremap <silent> <buffer> <Localleader>u :call jedi#usages()<CR>
    " autocmd FileType python nnoremap <buffer> <Localleader>v2 :call jedi#force_py_version(2)
    " autocmd FileType python nnoremap <buffer> <Localleader>v3 :call jedi#force_py_version(3)

    " Use :Pyimport <module name> to open module (e.g. os)
augroup END

" augroup reload_vimrc
"     autocmd!
"     " Reload $MYVIMRC on write
"     autocmd BufWritePost $MYVIMRC source $MYVIMRC
" augroup END

" augroup nvim_format
"     autocmd!
"     autocmd FileType python autocmd BufWritePre <buffer> call StripTrailingWhitespace()
" augroup end


" Functions and commands
function! ExecuteCommand(command)
    " prepare: save last search and position
    let _s = @/
    let l = line(".")
    let c = col(".")
    " exec command
    execute a:command
    " clean up and restore
    let @/ = _s
    call cursor(l, c)
endfunction


command! -nargs=0 StripTrailingWhitespace call ExecuteCommand("%s/\\s\\+$//e")


command! -nargs=0 FilenameToClipboard let @+ = expand("%")


command! -nargs=0 ToggleWhitespace set list!


function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
command! -nargs=0 ToggleNumber call ToggleNumber()


command! -nargs=0 ToggleSpellCheck setlocal spell! spelllang=en_us


" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
    let spccol = repeat(' ', a:cols)
    let result = substitute(a:indent, spccol, '\t', 'g')
    let result = substitute(result, ' \+\ze\t', '', 'g')
    if a:what == 1
        let result = substitute(result, '\t', spccol, 'g')
    endif
    return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
    let savepos = getpos('.')
    let cols = empty(a:cols) ? &tabstop : a:cols
    execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
    call histdel('search', -1)
    call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)


function! <SID>MaximizeToggle()
    if exists('s:maximize_session')
        exec "source " . s:maximize_session
        call delete(s:maximize_session)
        unlet s:maximize_session
        let &hidden = s:maximize_hidden_save
        unlet s:maximize_hidden_save
    else
        let s:maximize_hidden_save = &hidden
        let s:maximize_session = tempname()
        set hidden
        exec "mksession! " . s:maximize_session
        only
    endif
endfunction
command! -nargs=0 MaximizeToggle call <SID>MaximizeToggle()


function! ToggleColorColumn()
    if &colorcolumn
        setlocal colorcolumn=
    else
        setlocal colorcolumn=80
    endif
endfunction
command! -nargs=0 ToggleColorColumn call ToggleColorColumn()


" Mappings

" Normal mode
" Disable Ex mode
nnoremap Q <Nop>
" Disable macros recording
nnoremap q <Nop>
" Remap ; to :
nnoremap ; :
" Navigate
noremap <silent> <Up> gk
noremap <silent> <Down> gj
noremap <silent> k gk
noremap <silent> j gj
noremap H ^
noremap L g_
noremap J 6j
noremap K 6k
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>
nnoremap <Up> :tabnext<CR>
nnoremap <Down> :tabprev<CR>
nnoremap / /\v
nnoremap ? ?\v
" Folds
nnoremap zr zr:echo &foldlevel<CR>
nnoremap zm zm:echo &foldlevel<CR>
nnoremap zR zR:echo &foldlevel<CR>
nnoremap zM zM:echo &foldlevel<CR>
nnoremap za za:echo &foldlevel<CR>
" Clear search results
nnoremap <silent> <Esc> :nohlsearch<CR>
" Select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
" Redo
nnoremap U <C-r>
nnoremap <M-h> :vertical resize +5<CR>
nnoremap <M-l> :vertical resize -5<CR>

" Visual mode
vnoremap / /\v
vnoremap ? ?\v
" Align blocks of text and keep them selected
vnoremap < <gv
vnoremap > >gv

" Insert mode bindings
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End> <C-o>g<End>
inoremap <M-k> <Up>
inoremap <M-j> <Down>
inoremap <M-h> <Left>
inoremap <M-l> <Right>
inoremap <M-p> <C-Left>
inoremap <M-n> <C-Right>
" Escape insert, delete line, return to insert
inoremap <C-d> <Esc>ddi
" Escape insert, create new line, edit it
inoremap <C-o> <Esc>o
" Smash escape
inoremap jk <Esc>
inoremap kj <Esc>
" Navigate in popup
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Terminal normal mode
tnoremap <Esc> <C-\><C-n><Esc><CR>

" Space-like bindings
" Toggle
nnoremap <Leader>tw :ToggleWhitespace<CR>
nnoremap <Leader>tn :ToggleNumber<CR>
nnoremap <Leader>ts :ToggleSpellCheck<CR>
nnoremap <Leader>tk :terminal<CR>
nnoremap <Leader>tc :nohlsearch<CR>
nnoremap <Leader>ti :IndentLinesToggle<CR>
nnoremap <Leader>td :call deoplete#toggle()<CR>
nnoremap <Leader>th :VimCurrentWordToggle<CR>
nnoremap <Leader>tl :ToggleColorColumn<CR>
let g:AutoPairsShortcutToggle = "<Leader>tp"
nnoremap <Leader>tt :TagbarToggle<CR>

" Edit
nnoremap <Leader>ed :StripTrailingWhitespace<CR>
" Search and replace
nnoremap <Leader>er :%s//g<Left><Left>
" Reindent buffer
nnoremap <Leader>ei :mzgg=G`z<CR>
noremap <Leader>et :Tab2Space<CR>
noremap <Leader>eT :Space2Tab<CR>
noremap <Leader>en :RetabIndent<CR>

" File
" Sudo save
nnoremap <Leader>fs :update !sudo tee % >/dev/null<CR>
nnoremap <Leader>fn :FilenameToClipboard<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fh :Files ~<CR>

" Buffer
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bl :blast<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bh :Startify<CR>
nnoremap <Leader>bb :Buffers<CR>

" Window
nnoremap <Leader>ws :split<CR>
nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>wn :vnew<CR>
nnoremap <Leader>wr <C-w>r
nnoremap <Leader>wR <C-w>R
nnoremap <Leader>wc :close<CR>
nnoremap <Leader>wo :only<CR>
nnoremap <Leader>wo :MaximizeToggle<CR>
nnoremap <Leader>wp <C-w>P
nnoremap <Leader>wn <C-w>=
nnoremap <Leader>wu :resize +5<CR>
nnoremap <Leader>wb :resize -5<CR>
nnoremap <Leader>ww :Windows<CR>

" Project
nnoremap <Leader>pr :ProjectMru -tiebreak=end<CR>

" Search maps with fzf
nmap <Leader>? <Plug>(fzf-maps-n)


" Initial settings
set nolist
set nospell

