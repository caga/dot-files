"<VIM-PLUGins>
    call plug#begin('~/.vim/plugged')
        "Snippets
        Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
        "Search
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        "vifm for vim
        Plug 'vifm/vifm.vim'
        "Completer
        " Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --java-completer' }
         Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
        "commentator
         Plug 'tpope/vim-commentary'
        "Otomatik xml tag kapama
        Plug 'othree/xml.vim'
        " indentation line
        Plug 'Yggdroot/indentLine'
        "surround
        Plug 'tpope/vim-surround'
        "html xml tag closer
        " Plug 'Valloric/MatchTagAlways'
        "syntaz checker
        " Plug 'scrooloose/syntastic'
        Plug 'vim-syntastic/syntastic'
        "markdown previewre with everything
        " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
        "markdown preview but local server"
        " Plug 'previm/previm'
        "git control in vim
        " Plug 'tpope/vim-fugitive'
        "css kodda rank görünümü
        " Plug 'ap/vim-css-color'
        "html i kısa yoldan yazmak
        " Plug 'rstacruz/sparkup'
        "JAVA DEBUGGER
        " Plug 'idanarye/vim-vebugger'
        "Vebuuger için gerekli
        " Plug 'Shougo/vimproc.vim'
        "Vim-matchit % operator
        Plug 'https://github.com/adelarsq/vim-matchit'
        "otomatik parantez tırnak felan kapama
        " Plug 'adelarsq/Vim-Autoclose'
        "Serbest Yazı"
        " Plug 'junegunn/goyo.vim'
        "bi markdown plugini concealingi önleme,folding felan"
        " Plug 'plasticboy/vim-markdown'
        "PlantUml viewer"
        " Plug 'weirongxu/plantuml-previewer.vim'
            "dependencies for plantuml viewer plugin"
            " Plug 'tyru/open-browser.vim'
            " Plug 'aklt/plantuml-syntax'
        "node environment"
        " Plug 'moll/vim-node'
        "javascript syntax checker"
        " Plug 'jelera/vim-javascript-syntax'
        " Plug 'vim-vdebug/vdebug' 
        " Plug 'vifm/vifm.vim'
        " Plug 'python-rope/ropevim', {'do': 'python setup.py --install'}  
        Plug 'lervag/vimtex'
        Plug 'dylanaraps/wal.vim'
        " Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
    call plug#end()
packadd! matchit
"<vifm>"
let g:vifm_embed_term=1
"<Syntastic>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"<STATUSLINE>
    set laststatus=2
    " set statusline=lightsaber!
    " set statusline=%f
    " :h mode() to see all modes

    let g:currentmode={
                \ 'n'      : 'N ',
                \ 'no'     : 'N·Operator Pending ',
                \ 'v'      : 'V ',
                \ 'V'      : 'V·Line ',
                \ '\<C-V>' : 'V·Block ',
                \ 's'      : 'Select ',
                \ 'S'      : 'S·Line ',
                \ '\<C-S>' : 'S·Block ',
                \ 'i'      : 'I ',
                \ 'R'      : 'R ',
                \ 'Rv'     : 'V·Replace ',
                \ 'c'      : 'Command ',
                \ 'cv'     : 'Vim Ex ',
                \ 'ce'     : 'Ex ',
                \ 'r'      : 'Prompt ',
                \ 'rm'     : 'More ',
                \ 'r?'     : 'Confirm ',
                \ '!'      : 'Shell ',
                \ 't'      : 'Terminal '
                \}

    " Automatically change the statusline color depending on mode

    function! ChangeStatuslineColor()

        if (mode() =~# '\v(n|no)')
            exe 'hi! StatusLine ctermfg=008'
        elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
            exe 'hi! StatusLine ctermfg=005'
        elseif (mode() ==# 'i')
            exe 'hi! StatusLine ctermfg=004'
        else
            exe 'hi! StatusLine ctermfg=006'
        endif
        return ''
    endfunction

    " Find out current buffer's size and output it.

    function! FileSize()

        let bytes = getfsize(expand('%:p'))
        if (bytes >= 1024)
            let kbytes = bytes / 1024
        endif

        if (exists('kbytes') && kbytes >= 1000)
            let mbytes = kbytes / 1000
        endif

        if bytes <= 0
            return '0'
        endif

        if (exists('mbytes'))
            return mbytes . 'MB '

        elseif (exists('kbytes'))
            return kbytes . 'KB '
        else
            return bytes . 'B '
        endif
    endfunction

    function! ReadOnly()
        if &readonly || !&modifiable
            return ''
        else
            return ''
        endfunction
        " function! GitInfo()
            " let git = fugitive#head()
            " if git != ''
                " return ' '.fugitive#head()
            " else
                " return ''
            " endfunction

            set laststatus=2
            set statusline=
            set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
            set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
            set statusline+=%8*\ [%n]                                " buffernr
            " set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
            set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
            set statusline+=%#warningmsg#
            " set statusline+=%{SyntasticStatuslineFlag()}             " Syntastic errors
            set statusline+=%*
            set statusline+=%9*\ %=                                  " Space
            set statusline+=%8*\ %y\                                 " FileType
            set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
            set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
            set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
            hi User1 ctermfg=007
            hi User2 ctermfg=008
            hi User3 ctermfg=008
            hi User4 ctermfg=008
            hi User5 ctermfg=008
            hi User7 ctermfg=008
            hi User8 ctermfg=008
            hi User9 ctermfg=007

"<Basic Ayarlar>"
    filetype plugin indent on
    syntax on
    noremap <F4> :set hlsearch! hlsearch?<CR>
    set number
    set foldmethod=manual
    " set conceallevel=0
" autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
"<BASIC TAB SPACING FOR HTML>
    set tabstop=8 expandtab shiftwidth=4 softtabstop=4 smarttab
    autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab

"<KEYMAPS>        
    let mapleader=","
    let maplocalleader = "\\"
    map <leader>f :Files<CR>
    map <leader>g :Rg<CR>
    map<leader>fd :FZF ../<CR>
    map<leader>fdd :FZF ../../<CR>

    map <space>f :tab split<CR>
    map <space>k :tabc<CR>
    imap kj <esc>
    map <leader>e :Vifm<CR>
    " noremap <nowait> t h
    " noremap <nowait> k j
    " noremap <nowait> m k
    " noremap <nowait> l l
" <cTAGS>
    "CTAGS ayarları!!! Projenin başında ctags -R komutu ile tag
    "dosyası oluşturuyorsun! vimrc de set tags=tags; yazıyorsun. eğer set autochdir
    "öselliğini kullanmıyorsan ama yukarı yönlü search özelliğini istiyorsan bu
    "sefer set tags=./tags; diyorsun. burada ./ vim e working directory değil o
    "anki directory i kullanmasını söylüyor. 
    "şimdi kod dosyaları içinde class üzerine gelip ctrl-] yaparak o classın
    "kodunu görebilirsin.ctlr-t ile geri dönebilirsin.
    set tags=tags

"<FZF FUNCTIONS>
    "FZF Buffer Search
    function! s:buflist()
      redir => ls
      silent ls
      redir END
      return split(ls, '\n')
    endfunction

    function! s:bufopen(e)
      execute 'buffer' matchstr(a:e, '^[ 0-9]*')
    endfunction

    nnoremap <silent> <Leader><Enter> :call fzf#run({
    \   'source':  reverse(<sid>buflist()),
    \   'sink':    function('<sid>bufopen'),
    \   'options': '+m',
    \   'down':    len(<sid>buflist()) + 2
    \ })<CR>
    " Open files in horizontal split
    nnoremap <silent> <Leader>s :call fzf#run({
    \   'down': '40%',
    \   'sink': 'botright split' })<CR>

    " Open files in vertical horizontal split
    nnoremap <silent> <Leader>v :call fzf#run({
    \   'right': winwidth('.') / 2,
    \   'sink':  'vertical botright split' })<CR>

"<ŞABLON KULLANMA AYARLARI>
    "şablonları templates in altına hazırla
    if has("autocmd")
      augroup templates
        autocmd BufNewFile *.sh.md 0r ~/.vim/templates/skeleton.sh
        autocmd BufNewFile *.usecase.md 0r ~/.vim/templates/template.usecase.md
      augroup END
    endif

"<YOUCOMPLETEME AYARLARI>
    " let g:syntastic_java_checkers = []

"<ULTISNIP>
        let g:UltiSnipsExpandTrigger="<c-s>"
        let g:UltiSnipsJumpForwardTrigger="<c-n>"
        let g:UltiSnipsJumpBackwardTrigger="<c-p>"
        let g:UltiSnipsListSnippets="<c-tab>"
    " If you want :UltiSnipsEdit to split your window.
        let g:UltiSnipsEditSplit="vertical"

"<FOLDING SAVE>
    " augroup AutoSaveFolds
      " autocmd!
      " autocmd BufWinLeave ?* mkview
      " autocmd BufWinEnter ?* silent loadview
    " augroup END

"<MarkDown Preview AYARLARI>
    " let g:mkdp_command_for_global = 1
    " let g:mkdp_open_ip = '172.26.140.25'
    " let g:mkdp_echo_preview_url = 1
    " let g:mkdp_port = '1453'

"<Syntastic Ayarları>"
    " set statusline+=%#warningmsg#
    " set statusline+=%{SyntasticStatuslineFlag()}
    " set statusline+=%*

    " let g:syntastic_always_populate_loc_list = 1
    " let g:syntastic_auto_loc_list = 1
    " let g:syntastic_check_on_open = 1
    " let g:syntastic_check_on_wq = 0

"<MarkDown Ayarları>
    " set nofoldenable
    " let g:vim_markdown_folding_disabled=1
"<File 4913 olmasın>"
    " set backupcopy=yes
"<vimtex>
        let g:tex_flavor='latex'
        let g:vimtex_view_method='zathura'
        let g:vimtex_quickfix_mode=0
        set conceallevel=1
        let g:tex_conceal='abdmg'
        " let g:tex_conceal_frac=1
        " set concealcursor=c
"<spell check>
setlocal spell
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
  exe 'normal! $be'
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

set spelllang=en_us
" imap <C-l> <c-g>u<Esc>[sz=`]a<c-g>u
imap <C-l> <c-g>u<Esc>[sz=a<c-g>u
            colorscheme wal
            set background=dark
            let &t_ZH="\e[3m"
            let &t_ZR="\e[23m"
            " set t_ZH=[3m
            " set t_ZR=[23m
            highlight Comment cterm=italic
