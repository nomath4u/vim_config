filetype plugin on
se nu
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set ai
set showmatch
set vb
set ruler
set laststatus=2
set backspace=indent,eol,start
set nocompatible
set background=dark
set showmode
syntax on

"Switch to using ag (The silver searcher) (This should be swapped to rg)
let g:ackprg = 'ag --nogroup --nocolor --column'
"
"Tags finding
set tags=tags;/

"Bind ctag index refresh to F12
"nnoremap <f12>  :silent !start /b ctags -R --fields=+liaS --c-kinds=+px --c++-kinds=+p\                          --extra=+q --languages=c,c++ --excmd=n . <cr>

"Tagbar
"let &rtp=&rtp.','.'/c/Users/harperc/tagbar'
"set autochdir
""set tags=./tags;
"nmap <F8> :TagbarToggle<CR>
nmap <F8> :TagbarOpenAutoClose<CR>

" Elixiry tag bar
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'p:protocols',
        \ 'm:modules',
        \ 'e:exceptions',
        \ 'y:types',
        \ 'd:delegates',
        \ 'f:functions',
        \ 'c:callbacks',
        \ 'a:macros',
        \ 't:tests',
        \ 'i:implementations',
        \ 'o:operators',
        \ 'r:records'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'p' : 'protocol',
        \ 'm' : 'module'
    \ },
    \ 'scope2kind' : {
        \ 'protocol' : 'p',
        \ 'module' : 'm'
    \ },
    \ 'sort' : 0
\ }



"Highlight after 80 characters NOTE: This won't happen in txt file due to wrap
"highlight ColorColumn ctermbg=7
":set colorcolumn=81

"Search highlighting
:set hlsearch

"Do stuff only for vimdiff
if &diff
    :set noro "Usually default is to open as read only, that doesn't help us
endif

"Pathogen
execute pathogen#infect()

"System clipboard stuff
"source ~/.vim/word_to_clipboard.vim

"Trailing whitespace marker
autocmd FileType c,cpp,ex,exs			call s:WhitespaceHighlighting()

 function s:WhitespaceHighlighting()
 	highlight default link LinuxError ErrorMsg
 	"match			LinuxError	" \+\t"		" spaces before tab
 	"match			LinuxError	"\s\+$"		" trailing whitespaces
 	syn match ErrorLeadSpace /^ \+/         " highlight any leading spaces
 	syn match ErrorTailSpace / \+$/         " highlight any trailing spaces
     highlight OverLength ctermbg=gray ctermfg=white guibg=#592929
     match OverLength /\%81v.\+/
 endfunction

set bg=dark

" always highlight trailing whitespace, tabs, spaces highlight ExtraWhitespace ctermbg=red guibg=red match ExtraWhitespace /\s\+$/ autocmd BufWinEnter * match ExtraWhitespace /\s\+$/ autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/ autocmd InsertLeave * match ExtraWhitespace /\s\+$/ autocmd BufWinLeave * call clearmatches()

"Fugitive stuff
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gp :Ggrep<Space>

set ignorecase

" Vim-Plug Automatically calls filetype plugin indent on and syntax enable if
" these are causing problems can be disablled after plug#end called
"
" This complains when it can't find git. Just move the disabled cygwin one
" back temporarily if that is the case
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }

call plug#end()

" FZF customizations
fu! FzfTagsCurrWord()
    let currWord = expand('<cword>')
    execute ':Tags '.currWord
endfu

nnoremap <leader>t :call FzfTagsCurrWord()<CR>
nnoremap <leader>f :Find<CR>
nnoremap <c-p> :FZF<CR> 

" NERDTree
nmap <F6> :NERDTreeToggle<CR>
