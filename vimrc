"Pathogen startup
    filetype off
    call pathogen#runtime_append_all_bundles()
    call pathogen#helptags()

" General settings
    let mapleader=","
    set nocompatible
    set novb
    set noeb
    set backspace=indent,eol,start
    set hidden
    set timeoutlen=400
    set history=100
    set virtualedit=all
    set wildmenu
    set wildmode=list:longest,list:full
    set wildignore+=*.o,*.obj,.git,*.rbc
    set nowrap

    set autowrite
    set noswapfile
    set nobackup

" Window title settings
    set title
    set titlestring=VIM

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
    set statusline=%<                                " Set truncate location
    set statusline+=--:--                            " For coolness
    set statusline+=\ \|%n\|                         " Buffer number
    set statusline+=\ %t                             " Current filename
    set statusline+=\ %((%M)%)                       " Modified flag
    set statusline+=\ \ \ %p%%                       " File scroll percentage
    set statusline+=\ (%l,%c)                        " Current coordinates
    set statusline+=\ \ %{SyntasticStatuslineFlag()} " Syntastic flags
    set statusline+=\ \ %{fugitive#statusline()}     " Git status
    set statusline+=%=                               " Seperator
    set statusline+=\ \ %{Fileinfo()}                " Filetype
    set statusline+=%r\ \                            " Readonly flag

    function! Fileinfo()
        let ft = &filetype 
        let indent = &shiftwidth
        let type = "null"
        if (&expandtab == 0)
            let type = "hard"
        else
            let type = "soft"
        end
        let finfo = "[".ft." | ".indent." | ".type."]"

        if (ft == "")
            return ""
        else
            return finfo
        end
    endfunction
    
    set laststatus=2 
    set showcmd
    set showmode

" GUI settings
    set lazyredraw
    set mousehide
    set guioptions=acr
    set scrolloff=8
    set number
    set cursorline
    
" Colors and fonts
    color ir_black
    "set guifont=Espresso\ Mono\ Bold\ 10
    set guifont=Bitstream\ Vera\ Sans\ Mono\ Bold\ 10

" Omnicomplete settings
    " Menu settings
    set completeopt=longest,menuone
    inoremap <expr> <C-n> pumvisible() ? '<C-n>' : \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
    inoremap <expr> <M-,> pumvisible() ? '<C-n>' : \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

    " Super Tab plugin
    let g:SuperTabLongestEnhanced=1
    let g:SuperTabDefaultCompletionType='context'
    let g:SuperTabCrMapping=0

" Bubble movement
    nmap <C-up> [e
    nmap <C-down> ]e
    vmap <C-up> [egv
    vmap <C-down> ]egv

" Mapping settings
    " Toggles
    nmap <silent> ,cd :cd %:h<CR>
   nmap <silent> ,md :!mkdir -p %:p:h<CR>
    nmap <silent> ,n :set invhls<CR>:set hls?<CR>
    nmap <silent> ,p :set invpaste<CR>:set paste?<CR>
    nmap  ,e :e <C-R>=expand("%:p:h") . "/"<CR>

    " Shortcuts
    nmap <silent> ,ev :e $MYVIMRC<CR>
    nnoremap ; :
    imap jj <ESC>

    " Window movements
    noremap <silent> ,nw :wincmd n<CR>
    noremap <silent> ,nv :vnew<CR>
    noremap <silent> ,h :wincmd h<CR>
    noremap <silent> ,j :wincmd j<CR>
    noremap <silent> ,k :wincmd k<CR>
    noremap <silent> ,l :wincmd l<CR>
    noremap <silent> ,cj :wincmd j<CR>:close<CR>
    noremap <silent> ,ck :wincmd k<CR>:close<CR>
    noremap <silent> ,ch :wincmd h<CR>:close<CR>
    noremap <silent> ,cl :wincmd l<CR>:close<CR>
    noremap <silent> ,cw :close<CR>
    noremap <silent> ,co :copen<CR>
    noremap <silent> ,cq :cclose<CR>
    noremap <silent> ,ml <C-W>L
    noremap <silent> ,mk <C-w>K
    noremap <silent> ,mh <C-w>H
    noremap <silent> ,mj <C-w>J


    "Session hotkeys
    nmap <leader>ssa :wa<CR> :mksession! ~/.vim_session<CR>
    nmap <leader>so :wa<CR>:so ~/.vim_session<CR>

" File plugins
" MRU plugin
    nmap ,mr :MRU<CR>

" Command T plugin
    let g:CommandTMaxFiles=2200
    let g:CommandTMaxHeight=6
    let g:CommandTMaxDepth=6
    let g:CommandTCancelMap='<C-x>'

    nmap <silent> <C-S-O> :CommandT<CR>
    nmap <silent> ,cf :CommandTFlush<CR>

" Fuzzy Finder plugin
    nmap <silent> ,ta :FufTag<CR>

" Lusty Explorer plugin
    nmap ,be :LustyBufferExplorer<CR>
    nmap ,bg :LustyBufferGrep<CR>

" MiniBuf Explorer plugin
    let g:miniBufExplMapCTabSwitchBufs=1
 
" NERD Tree plugin
    let NERDTreeWinPos="right"
    let NERDTreeChDirMode=2
    let NERDTreeStatusline="NERD Tree"

    nmap <silent> <F9> :NERDTreeToggle<CR>

" Tag list plugin
    let Tlist_WinWidth=23
    let Tlist_Exit_OnlyWindow=1

    nnoremap <silent> <F8> :TlistToggle<CR>

" Ruby plugins
    " Rails plugin
    nmap ,rc :Rcontroller<Space>
    nmap ,rm :Rmodel<Space>
    nmap ,rv :Rview<Space>
    nmap ,rs :Rscript<Space>
    nmap ,rS :Rserver!<CR>
    nmap ,rr :Rake<Space>

    " Ruby hotkeys
    imap <C-l> <Space>=><Space>
    imap <C-k> <C-o>b:<Esc>Ea
    nmap <C-k> lbi:<Esc>E

    " RSense plugin
    let g:rsenseHome="/home/junxuan/.vim/bundle/rsense/rsense"
    let g:rsenseUseOmniFunc=1

    " RFactor plugin
    nnoremap <leader>rap :call AddParameter()<CR>
    vnoremap <leader>rlv :call RenameLocalVariable()<CR>
    nnoremap <leader>rlv viw:call RenameVariableProxy()<CR>
    vnoremap <leader>riv :call RenameInstanceVariable()<CR>
    vnoremap <leader>rem :call ExtractMethod()<CR>

" C++ plugins
    " OmniCpp plugin
    let OmniCpp_NamespaceSearch=1 
    let OmniCpp_ShowPrototypeInAbbr=1

    map ,gt :silent !ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

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
    let g:protodefprotogetter="~/.vim/bundle/vim-protodef/pullproto.pl"

    " Single Compile plugin
    nmap <C-F9> :SCCompileRun<CR>

    " Delimit Mate plugin
    let delimitMate_expand_cr=1
    let delimitMate_expand_space=1

" HTML plugins
    " Zen Coding plugin
    let g:user_zen_expandabbr_key="<C-e>"

" Utility plugins
    " NERD Commenter plugin
    let g:NERDCreateDefaultMappings=0

    " Surround plugin
    let g:surround_45="<% \r %>"
    let g:surround_61="<%= \r %>"

    " UltiSnips
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    " Twitvim plugin
    let twitvim_browser_cmd='google-chrome'
    let twitvim_login="JxMKor:junrox" 
    let twitvim_count=30
    let twitvim_old_retweet=1

    nmap ,tf :FriendsTwitter<CR>
    nmap ,tr :RefreshTwitter<CR>
    nmap ,tm :MentionsTwitter<CR>
    nmap ,td :DMTwitter<CR>
    nmap ,ts :DMSentTwitter<CR>
    nmap ,tsd :SendDMTwitter
    nmap ,tw :PosttoTwitter<CR>

    " Align plugin
    vmap ,a :Align 

    " Syntastic plugin
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=1
    
" Autocommands
if has("autocmd")
    " Omni Completion
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    "autocmd FileType javascript set tags+=~/Downloads/tags
    autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
    autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
    autocmd FileType php        set tags+=~/.vim/tags/wordpress
    autocmd FileType java       set omnifunc=javacomplete#Complete
    autocmd FileType cpp        set tags+=~/.vim/bundle/omnicpp/tags/cpp

    " Indentation
    autocmd FileType make       setlocal noet
    autocmd FileType ruby,eruby setlocal ai et ts=2 sw=2 tw=2
    autocmd FileType css        setlocal ai et ts=2 sw=2 tw=2
    autocmd FileType javascript setlocal ai et ts=2 sw=2 tw=2

    " Syntax
    autocmd FileType javascript set syntax=jquery
end

" Windows shortcuts
    source $VIMRUNTIME/mswin.vim

" Start Vim maximized
    if has("gui_running")
      " GUI is running or is about to start.
      " Maximize gvim window.
      set lines=999 columns=999
    endif

" VIM Context inspector
    nmap <C-S-P> :call <SID>SynStack()<CR>
    function! <SID>SynStack()
        if !exists("*synstack")
            return
        endif
        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfun
