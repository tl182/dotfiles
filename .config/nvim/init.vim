scriptencoding utf-8

" Commands:
" :Toggleline           - toggle vertical line at 80th column
" :Space2tab            - convert spaces to tabs
" :Tab2Space            - convert tabs to spaces
" :Retabindent          - re-indent
" :Stripws              - strip trailing whitespaces
" :Cpfilename           - copy filename

" :Vexplore             - open netrw
" :vert help <help-name> - to show help in new vertical buffer

" :vnew                 - new vertical split
" :vsplit               - vertical split
" :close, <C-w>c        - close
" :only, <C-w>o         - maximize
" <C-w>r/R              - rotate
" <C-w>_,|,+,-,=,<,>    - resize

" :copen                - open quickfix
" :cn, :cp              - next, prev
" :lopen                - open loclist
" :lclose               - close loclist
" :reg <register-name>  - show register

" Profiling:
" :syntime on           - start profile
" :syntime report       - show report

" Spellcheck:
" :setlocal spell! spelllang=en_us<CR> - toggle
" [s, ]s - previous and next error


" Add already installed fzf to runtimepath
set runtimepath+=~/.fzf

" Set up plugins
call plug#begin('~/.local/share/nvim/plugged')

    " Service
    Plug 'roxma/python-support.nvim'

    " Appearance, UI
    Plug 'morhetz/gruvbox'
    Plug 'mhinz/vim-startify'
    Plug 'itchyny/lightline.vim'
    Plug 'mgee/lightline-bufferline'
    Plug 'maximbaz/lightline-trailing-whitespace'
    Plug 'Yggdroot/indentLine'
    Plug 'dominikduda/vim_current_word'

    " Editing
    Plug 'matze/vim-move'
    Plug 'scrooloose/nerdcommenter'
    Plug 'majutsushi/tagbar'
    Plug 'jiangmiao/auto-pairs'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'wellle/targets.vim'
    Plug 'rhysd/clever-f.vim'
    Plug 'eugen0329/vim-esearch'
    Plug 'christoomey/vim-tmux-navigator'

    " Autocomplition, snippets, linting, formatting
    Plug 'roxma/nvim-completion-manager'
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'w0rp/ale'
    Plug 'sbdchd/neoformat'

    " Python
    Plug 'davidhalter/jedi-vim'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'Glench/Vim-Jinja2-Syntax'

    " JavaScript
    Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
    Plug 'ternjs/tern_for_vim'
    " Plug 'othree/yajs.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'

    " TypeScript
    Plug 'mhartington/nvim-typescript'
    " Plug 'HerringtonDarkholme/yats.vim'
    Plug 'leafgarland/typescript-vim'

    " Json
    Plug 'elzr/vim-json'

    " Markdown
    Plug 'rhysd/vim-gfm-syntax'

    " Fish shell
    Plug 'aliva/vim-fish'

    " File management
    Plug 'junegunn/fzf.vim'
    Plug 'cocopon/vaffle.vim'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'jreybert/vimagit'

call plug#end()


" Settings
" Timeout settings
set timeoutlen=300
set ttimeoutlen=50


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
set directory=~/.local/share/nvim/swap
set display+=lastline
set formatoptions=tcqj
set history=1000
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


" Set listchars
set list
if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:→ ,eol:↵,trail:~,extends:↷,precedes:↶,nbsp:±'
else
    let &listchars = 'tab:> ,eol:¬,trail:~,extends:>,precedes:<,nbsp:.'
endif


" Scroll settings
if !&scrolloff
    set scrolloff=5                 " Show next 5 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5             " Show next 5 columns while side-scrolling.
endif


" Undo, backup, swap
set undofile
set nobackup
set swapfile


" Command line
set wildmenu
set wildmode=list:full
set wildignore+=*~,*.o,core.*,*.exe,.git/,.hg/,.svn/,.DS_Store,*.pyc
set wildignore+=*.swp,*.swo,*.class,*.tags,tags,tags-*,cscope.*,*.taghl
set wildignore+=.ropeproject/,__pycache__/,venv/,*.min.*,images/,img/,fonts/
set wildignorecase


" Fold options
set foldenable                      " Enable folds
set foldmethod=syntax               " Fold via syntax of files
set foldlevelstart=99               " Open all folds by default


" Other options
set completeopt=menu,longest        " Set completion menu
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
set numberwidth=1                   " Minimal line number width
set relativenumber                  " Relative numbering
set report=0                        " Always report changed lines
set showfulltag                     " Show tag and info in insert-mode completion
set showmatch                       " Highlight matched bracket
" set showmode                        " Show current mode
set showtabline=2                   " Always show tabline
set smartcase                       " Smart case search if there is upper
set spell                           " Enable spell check
set splitbelow                      " Split below current window
set splitright                      " Split right of the current window
set synmaxcol=128                   " Highlight columns (default 3000, 0 - no limit)
set textwidth=0                     " Hard-wrap long lines as you type them
set title                           " Set terminal's title
set whichwrap+=<,>,h,l              " Allow backspace and cursor keys to cross line boundaries
set wrap                            " Enable word wrap
set wrapscan                        " Searches wrap around end of file


" Plugin configuration (:help <PluginName>)
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
set noshowmode

" netrw
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = -30
let g:netrw_list_hide = &wildignore
let g:netrw_sort_sequence = '[\/]$,*'

" Startify
let g:startify_session_dir = '~/.local/share/nvim/sessions'
let g:startify_bookmarks = ['~', '~/Desktop']
let g:startify_change_to_vcs_root = 1

" python-support
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]), 'jedi')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]), 'flake8')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]), 'pylint')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]), 'mypy')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]), 'autopep8')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]), 'isort')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]), 'psutil')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]), 'setproctitle')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]), 'mistune')

" nvim-completion-manager (ncm)
set shortmess+=c

" neosnippet
imap <C-s> <Plug>(neosnippet_expand_or_jump)
" let g:neosnippet#enable_snipmate_compatibility = 1

" lightline
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
let g:lightline.active = {}
let g:lightline.active.right = [
    \ ['trailing'], ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']
    \ ]
let g:lightline.tabline = { 'left': [ ['buffers'] ], 'right': [ [''] ] }
let g:lightline.component_expand = {
    \ 'buffers': 'lightline#bufferline#buffers',
    \ 'trailing': 'lightline#trailing_whitespace#component',
    \ }
let g:lightline.component_type = {
    \ 'buffers': 'tabsel',
    \ 'trailing': 'error',
    \ }
let g:lightline#bufferline#show_number = 1

" indentLine
let g:indentLine_char='│'

" vim_current_word
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 1
highlight CurrentWord gui=underline cterm=underline
highlight CurrentWordTwins gui=underline cterm=underline

" AutoPairs
let g:AutoPairsShortcutToggle = ""
let g:AutoPairsShortcutFastWrap = ""
let g:AutoPairsShortcutJump = ""
let g:AutoPairsShortcutBackInsert = ""
let g:AutoPairsMapCh = 0
let g:AutoPairsFlyMode = 0

" NERDCommenter
let g:NERDSpaceDelims = 1
nmap <Leader>\ <Plug>NERDCommenterToggle
vmap <Leader>\ <Plug>NERDCommenterToggle

" tagbar
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

" FZF
let $LANG = 'en_US'
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
        \ }

" esearch
let g:esearch#out#win#open = 'enew'
if !exists('g:esearch')
    let g:esearch = {}
endif
let g:esearch.backend = 'nvim'
" let g:esearch.out = 'qflist'
let g:esearch.use = []
" Start esearch prompt autofilled with one of g:esearch.use initial patterns
call esearch#map('<Leader>es', 'esearch')
" Start esearch autofilled with a word under the cursor
call esearch#map('<Leader>ew', 'esearch-word-under-cursor')

" jedi-vim
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#use_tag_stack = 1
let g:jedi#show_call_signatures = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#auto_close_doc = 1

" tern (requires global node installation, not nvm)
" let g:tern_map_keys = 0
" let g:tern_show_argument_hints = 'on_move'
" let g:tern_show_signature_in_pum = 0
" let g:tern_show_loc_after_rename = 1

" ale
let g:ale_enabled = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_highlights = 0
let g:ale_set_signs = 1
let g:ale_echo_cursor = 1
let g:ale_set_balloons = 0
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_linters = {
    \ 'python': ['flake8', 'mypy'],
    \ 'javascript': ['eslint'],
    \ 'typescript': ['tslint']
    \ }
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_linter_aliases = {'html': ['html', 'javascript', 'css']}

" neoformat
let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_python = ['autopep8', 'isort']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
nnoremap <Localleader>f :Neoformat<CR>

" vim-json
let g:vim_json_syntax_conceal = 0

" clever-f
let g:clever_f_across_no_line = 1
let g:clever_f_smart_case = 1
let g:clever_f_show_prompt = 1


" Autocmds
augroup MyNvimBasic
    autocmd!
    " Speed up Syntax Highlighting
    " autocmd BufEnter * :syntax sync minlines=128
    " autocmd BufEnter * :syntax sync maxlines=256
    " Go back to previous position of cursor
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
    autocmd FileType python setlocal
        \ foldmethod=indent
        \ tabstop=4
        \ shiftwidth=4
        \ softtabstop=4
        \ expandtab
        \ autoindent
        \ fileformat=unix
    autocmd FileType python nnoremap <buffer> <Localleader>g :call jedi#goto()<CR>
    autocmd FileType python nnoremap <buffer> <Localleader>a :call jedi#goto_assignments()<CR>
    autocmd FileType python nnoremap <buffer> <Localleader>d :call jedi#show_documentation()<CR>
    autocmd FileType python nnoremap <buffer> <Localleader>r :call jedi#rename()<CR>
    autocmd FileType python nnoremap <buffer> <Localleader>u :call jedi#usages()<CR>
    autocmd FileType python nnoremap <buffer> <Localleader>v2 :call jedi#force_py_version(2)
    autocmd FileType python nnoremap <buffer> <Localleader>v3 :call jedi#force_py_version(3)
augroup END

augroup MyJavaScriptAutocmds
    autocmd!
    autocmd FileType javascript setlocal
        \ foldmethod=indent
        \ tabstop=4
        \ shiftwidth=4
        \ softtabstop=4
        \ expandtab
        \ autoindent
        \ fileformat=unix
    autocmd FileType javascript nnoremap <buffer> <Localleader>d :TernDoc<CR>
    autocmd FileType javascript nnoremap <buffer> <Localleader>t :TernType<CR>
    autocmd FileType javascript nnoremap <buffer> <Localleader>g :TernDef<CR>
    autocmd FileType javascript nnoremap <buffer> <Localleader>a :TernRefs<CR>
    autocmd FileType javascript nnoremap <buffer> <Localleader>r :TernRename<CR>
augroup END

augroup MyTypeScriptAutocmds
    autocmd!
    autocmd FileType typescript setlocal
        \ foldmethod=indent
        \ tabstop=4
        \ shiftwidth=4
        \ softtabstop=4
        \ expandtab
        \ autoindent
        \ fileformat=unix
    autocmd FileType typescript nnoremap <buffer> <Localleader>g :TSTypeDef<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>a :TSDef<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>d :TSDoc<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>r :TSRename<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>u :TSRefs<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>t :TSType<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>i :TSImport<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>cs :TSStart<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>cc :TSStop<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>cr :TSRestart<CR>
augroup END

augroup MyTextFileAutocmds
    autocmd!
    autocmd FileType yaml setlocal
        \ foldmethod=indent
        \ tabstop=2
        \ shiftwidth=2
        \ softtabstop=2
        \ expandtab
        \ autoindent
        \ fileformat=unix
    autocmd FileType json setlocal
        \ foldmethod=indent
        \ tabstop=2
        \ shiftwidth=2
        \ softtabstop=2
        \ expandtab
        \ autoindent
        \ fileformat=unix
augroup END


" Functions and commands
function! ExecuteCommand(command)
    let _s = @/
    let l = line(".")
    let c = col(".")
    execute a:command
    let @/ = _s
    call cursor(l, c)
endfunction
command! -nargs=0 Stripws call ExecuteCommand("%s/\\s\\+$//e")

command! -nargs=0 Cpfilename let @+ = expand("%")

function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc


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
command! -nargs=? -range=% Space2tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% Retabindent call IndentConvert(<line1>,<line2>,&et,<q-args>)

function! ToggleColorColumn()
    if &colorcolumn
        setlocal colorcolumn=
    else
        setlocal colorcolumn=80
    endif
endfunction
command! -nargs=0 Toggleline call ToggleColorColumn()


" Mappings

" Disable Ex mode
nnoremap Q <Nop>

" Disable macros recording
nnoremap q <Nop>

nnoremap ; :
nnoremap n nzz
nnoremap N Nzz

" Navigate
noremap k gk
noremap j gj
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k

" Splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tmux-navigator
if &term == 'screen-256color' || &term == 'tmux-256color'
    let g:tmux_navigator_no_mappings = 1
    let g:tmux_navigator_save_on_switch = 2
    nnoremap <C-h> :TmuxNavigateLeft<CR>
    nnoremap <C-j> :TmuxNavigateDown<CR>
    nnoremap <C-k> :TmuxNavigateUp<CR>
    nnoremap <C-l> :TmuxNavigateRight<CR>
endif

nnoremap zr zr:echo &foldlevel<CR>
nnoremap zm zm:echo &foldlevel<CR>
nnoremap zR zR:echo &foldlevel<CR>
nnoremap zM zM:echo &foldlevel<CR>
nnoremap za za:echo &foldlevel<CR>
nnoremap <Esc> :nohlsearch<CR>
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
noremap Y y$

" Redo
nnoremap U <C-r>

" Align blocks of text and keep them selected
vnoremap < <gv
vnoremap > >gv

" Insert mode bindings
inoremap <Home> <C-o>g<Home>
inoremap <End> <C-o>g<End>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-p> <C-Left>
inoremap <C-n> <C-Right>
inoremap <C-e> <Esc>A
inoremap <C-o> <Esc>o
inoremap jk <Esc>

" Navigate in popup
inoremap <expr> <C-j>   pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k>   pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <Esc>   pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"

" Terminal normal mode
tnoremap <Esc> <C-\><C-n><Esc><CR>

" Toggle
nnoremap <Leader>tw :set list!<CR>
nnoremap <Leader>tn :call ToggleNumber()<CR>
nnoremap <Leader>tk :terminal<CR>
nnoremap <Leader>ti :IndentLinesToggle<CR>
nnoremap <Leader>th :VimCurrentWordToggle<CR>
nnoremap <Leader>tc :set cursorline!<CR>
nnoremap <Leader>tl :Toggleline<CR>
nnoremap <Leader>tt :TagbarToggle<CR>

" Edit
nnoremap <Leader>ed :Stripws<CR>
nnoremap <Leader>er :%s//g<Left><Left>
nnoremap <Leader>eu :edit!<CR>

" File
nnoremap <Leader>f :GFiles<CR>
" Sudo save
" nnoremap <Leader>s :update !sudo tee % >/dev/null<CR>
nnoremap <Leader>s :w !sudo tee %<CR>
nnoremap <Leader>m :Vaffle<CR>
nnoremap <Leader>h :Vaffle %:p:h<CR>

" Buffer
nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bl :blast<CR>

" Windows and tabs
nnoremap <Leader>w :Windows<CR>
nnoremap <Leader>we :tabe<CR>
nnoremap <leader>wn :tabn<CR>
nnoremap <Leader>wp :tabp<CR>

" Lint (ale)
nnoremap <Leader>ll :ALELint<CR>
nnoremap <Leader>lp :ALEPreviousWrap<CR>
nnoremap <Leader>ln :ALENextWrap<CR>
nnoremap <Leader>lt :ALEToggle<CR>
nnoremap <Leader>ld :ALEDetail<CR>

" Git
nnoremap <Leader>gm :MagitOnly<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gg :Ggrep<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gr :Gmerge<CR>

" Search maps with fzf
nmap <Leader>? <Plug>(fzf-maps-n)


" Initial settings
set list
set nospell
