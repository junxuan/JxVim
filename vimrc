" Pathogen startup
    filetype off
    call pathogen#runtime_append_all_bundles()
    call pathogen#helptags()

" General settings
    set nocompatible
    set vb
    set backspace=indent,eol,start
    set hidden
    set timeoutlen=500
    set history=100
    set virtualedit=all
    set wildmenu

" File type settings
    filetype on
    filetype plugin on
    filetype indent on
    syntax on

" Indent settings   
    set autoindent
    set smartindent
    set tabstop=4
    set shiftwidth=4
    set expandtab

" Fold settings             
    set foldmethod=syntax
    set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
    set foldlevel=1
    set foldnestmax=2

" Search settings
    set wrapscan
    set ignorecase
    set smartcase
    set hlsearch
    set incsearch

" Status bar
    set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]\ Filetype:%Y
    set laststatus=2 
    set showcmd
    set showmode

" GUI settings
    set lazyredraw
    set mousehide
    set guicursor=n-v-c:block-Cursor-blinkon0
    set guicursor+=ve:ver35-Cursor
    set guicursor+=o:hor50-Cursor
    set guicursor+=i-ci:ver25-Cursor
    set guicursor+=r-cr:hor20-Cursor
    set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
    set guioptions=acr
    set scrolloff=5
    set number
    set cursorline
    
" Colors and fonts
    color ir_black
    set guifont=Espresso\ Mono\ Bold\ 10

" Omnicomplete settings
    "highlight Pmenu guibg=#CECECE guifg=#444444 gui=bold
    set completeopt=longest,menuone
    inoremap <expr> <C-n> pumvisible() ? '<C-n>' : \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
    inoremap <expr> <M-,> pumvisible() ? '<C-n>' : \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
    set tags+=~/.vim/tags/cpp

    " Ruby Specific
    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Mapping settings
    " Toggles
    nmap <silent> ,lcd :lcd %:h<CR>
    nmap <silent> ,md :!mkdir -p %:p:h<CR>
    nmap <silent> ,n :set invhls<CR>:set hls?<CR>

    " Window movements
    noremap <silent> ,h :wincmd h<CR>
    noremap <silent> ,j :wincmd j<CR>
    noremap <silent> ,k :wincmd k<CR>
    noremap <silent> ,l :wincmd l<CR>
    noremap <silent> ,sb :wincmd p<CR>
    noremap <silent> ,cj :wincmd j<CR>:close<CR>
    noremap <silent> ,ck :wincmd k<CR>:close<CR>
    noremap <silent> ,ch :wincmd h<CR>:close<CR>
    noremap <silent> ,cl :wincmd l<CR>:close<CR>
    noremap <silent> ,cc :close<CR>
    noremap <silent> ,cw :cclose<CR>
    noremap <silent> ,ml <C-W>L
    noremap <silent> ,mk <C-w>K
    noremap <silent> ,mh <C-w>H
    noremap <silent> ,mj <C-w>J

    " shortcuts
    nmap <silent> ,ev :e $MYVIMRC<CR>
    nmap <silent> ,sv :so $MYVIMRC<CR>
    nnoremap ; :
    imap jj <ESC>
    let mapleader=","

    " Ruby hotkeys
    imap <C-l> <Space>=><Space>
    imap <C-k> <C-o>b:<Esc>Ea
    nmap <C-k> lbi:<Esc>E

    "Session hotkeys
    nmap <leader>ssa :wa<CR>:mksession! ~/.vim/sessions/
    nmap <leader>so :wa<CR>:so ~/.vim/sessions

" Super Tab plugin
    let g:SuperTabDefaultCompletionType = '<C-X><C-O>'
    let g:SuperTabCrMapping=0

" Command T plugin
    let g:CommandTMaxHeight=6
    let g:CommandTMaxDepth=4

" NERD Tree plugin
    nmap <silent> <F9> :NERDTreeToggle<CR>
    let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$' ]
    let NERDTreeQuitOnOpen=1
    let NERDTreeWinPos="right"

" Tag list plugin
	nnoremap <silent> <F8> :TlistToggle<CR>
	let Tlist_WinWidth=23
	let Tlist_Auto_Open=1

" FSwitch plugin
	nmap <silent> <Leader>of :FSHere<cr>
	nmap <silent> <Leader>ol :FSRight<cr>
	nmap <silent> <Leader>oL :FSSplitRight<cr>
	nmap <silent> <Leader>oh :FSLeft<cr>
	nmap <silent> <Leader>oH :FSSplitLeft<cr>
	nmap <silent> <Leader>ok :FSAbove<cr>
	nmap <silent> <Leader>oK :FSSplitAbove<cr>
	nmap <silent> <Leader>oj :FSBelow<cr>
	nmap <silent> <Leader>oJ :FSSplitBelow<cr>
    
" Protodef plugin
    let g:protodefprotogetter = "~/.vim/bundle/vim-protodef/pullproto.pl"

" Delimit Mate plugin
    let delimitMate_expand_cr = 1
    let delimitMate_expand_space = 1

" Surround plugin
    let g:surround_45 = "<% \r %>"
    let g:surround_61 = "<%= \r %>"

" Single Compile plugin
    nmap <F9> :SCCompile<CR>
    nmap <C-F9> :SCCompileRun<CR>

" MRU plugin
    nmap ,mr :MRU<CR>
 
" Twitvim plugin
    let twitvim_browser_cmd='firefox'
    let twitvim_login="JxMKor:junrox" 

" Windows shortcuts
    source $VIMRUNTIME/mswin.vim

" Indentation
    autocmd FileType make        set noexpandtab
    autocmd FileType ruby,eruby  set ai et ts=2 sw=2 tw=2 

" Start Vim maximized
    if has("gui_running")
      " GUI is running or is about to start.
      " Maximize gvim window.
      set lines=999 columns=999
    else
      " This is console Vim.
      if exists("+lines")
        set lines=50
      endif
      if exists("+columns")
        set columns=100
      endif
    :endif
