" Mapleader allows for the <leader> command
let mapleader="-"

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Comment colors
hi Comment ctermfg=60

" This sets up the status bar at the bottom of the screen
set laststatus=2
set showmode
set showcmd


" Buffer Preferences
nnoremap <Tab> :bnext<CR>
nnoremap <BS> :bprev<CR>
nnoremap bw :bwipeout<CR>
nnoremap b :b<Space>

" Tab Preferences
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" Navigation Preferences
set number
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
inoremap jk <esc>
inoremap jj <esc>
inoremap kk <esc>
nnoremap vb <c-v>

" Easy commenting
vnoremap c I//<esc>

" Search Preferences
set hlsearch!
command H :set hlsearch!
set ignorecase
set smartcase
set autoindent
vnoremap // y/<C-R>"<CR>
nnoremap // *

set listchars=tab:>-

" plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
" vim/fzf (fuzzy finder)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'
" vim-airline (buffer ui)
Plug 'vim-airline/vim-airline'
" vim-fugitive (git wrapper)
Plug 'tpope/vim-fugitive'
" vim-github (vim session to github links)
Plug 'tschneiter/vim-github'
call plug#end()

" vim/fzf preferences
nnoremap <C-p> :Files<cr>
" Airline preferences
let g:airline#extensions#tabline#enabled = 1

" Hound
let g:hound_base_url = "hound.etsycorp.com"
let g:hound_port = "6080"
let g:hound_repo_paths = {
    \"etsyweb": "~/development/Etsyweb",
    \"bigdata": "~/development/BigData",
    \"Nagios": "~/development/nagios", }
nnoremap <C-h> :HoundQF<space>
let g:hound_vertical_split = 1

" Vim Session to Github Link Preferences
map <leader>G :Github<CR>
map <leader>g :Github l<CR>

" '-A' removes the line below, '-S' removes the line above in normal mode
" '-a' adds a line below, '-s' adds a line above in normal mode
nnoremap <silent><leader>A m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><leader>S m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><leader>a :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><leader>s :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Vimdiff
if &diff
    let g:lite_dfm_normal_bg_cterm=237
    nnoremap qq :qa<cr>
endif

" Typos
if has("user_commands")
    command! -bang -complete=file -nargs=? W w<bang> <args>
    command! -bang -complete=file -nargs=? Q q<bang> <args>
    command! -bang -complete=file -nargs=? WQ wq<bang> <args>
    command! -bang -complete=file -nargs=? Wq wq<bang> <args>
endif

command Newline %s/\\n/\r/g

" Allow gf to jump to symbols in etsyweb
set mouse=r
set path+=~/development/Etsyweb,
        \~/development/Etsyweb/phplib/EtsyModel,
        \~/development/Etsyweb/phplib,
        \~/development/Etsyweb/templates,
        \~/development/Etsyweb/htdocs/assets/js,
        \~/development/Etsyweb/htdocs/assets/css,
        \~/development/Etsyweb/phplib/Api,
        \~/development/Etsyweb/phplib/Api/Resrouce
set includeexpr=substitute(v:fname,'_','/','g').'.php'
set suffixesadd+=.tpl
set suffixesadd+=.js
set suffixesadd+=.jsx
set suffixesadd+=.mustache
