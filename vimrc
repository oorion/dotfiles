set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"============================================================================
"Plugin Stuff
"============================================================================

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-ragtag'
Plugin 'nanotech/jellybeans.vim'
Plugin 'fatih/vim-go'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'hwartig/vim-seeing-is-believing'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplete.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'vim-scripts/vim-auto-save'

"Plugin 'joshhartigan/vim-reddit'
"Plugin 'ryanss/vim-hackernews'

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
"
"==============================================================================================
"
"==============================================================================================


"Start Nerdtree if vim opens to empty file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"mouse/track pad enabled
set mouse=a

"NerdTree toggle
map <C-f> :NERDTreeToggle<CR>

" Remove creation of swap files
set noswapfile

"always show status line
set laststatus=2

"Color
colorscheme jellybeans

"" Basic editor behaviour
set t_Co=256                    " Explicitly tell vim that the terminal supports 256 colors
syntax enable                   " highlighting and shit
set cursorline                  " colours the line the cursor is on
set scrolloff=4                 " adds top/bottom buffer between cursor and window
set number                      " line numbers
set showcmd                     " display incomplete commands
set autoread                    " Auto-reload buffers when file changed on disk
set noshowmode                  " Get rid of default mode indicator
set autoindent                  " Set auto indent
set ts=2                        " Set indent to 2 spaces
set relativenumber              " Show relative line numbers
set vb                          " enable visual bell (disable audio bell)
set clipboard=unnamed           " use system clipboard

" correct tab spacing
set tabstop=2 shiftwidth=2 expandtab
"===================================================================================
"AUTO SAVE FEATURES
"===================================================================================
" enable AutoSave on Vim startup
let g:auto_save = 1

" do not change the 'updatetime' option
let g:auto_save_no_updatetime = 1

"let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

"let g:auto_save_silent = 1  " do not display the auto-save notification

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <Leader>w :w<CR>

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"enable airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"nmap <leader>1 <Plug>AirlineSelectTab1
"nmap <leader>2 <Plug>AirlineSelectTab2
"nmap <leader>3 <Plug>AirlineSelectTab3
"nmap <leader>4 <Plug>AirlineSelectTab4
"nmap <leader>5 <Plug>AirlineSelectTab5
"nmap <leader>6 <Plug>AirlineSelectTab6
"nmap <leader>7 <Plug>AirlineSelectTab7
"nmap <leader>8 <Plug>AirlineSelectTab8
"nmap <leader>9 <Plug>AirlineSelectTab9

"set leader key to be space
let mapleader = " "

"Vim rails shortcuts
map <Leader>vu :RVunittest<CR>
map <Leader>vm :RVmodel<CR>
map <Leader>vv :RVview<CR>
map <Leader>vc :RVcontroller<CR>
map <Leader>m :Rmodel<CR>
map <Leader>c :Rcontroller<CR>

"lightline config
"let g:lightline = {
      "\ 'colorscheme': 'jellybeans',
      "\ }

"vim-mustache-handlebars abbreviations
let g:mustache_abbreviations = 1

"Seeing is Believing
" Gvim
"nmap <buffer> <M-r> <Plug>(seeing-is-believing-run)
"xmap <buffer> <M-r> <Plug>(seeing-is-believing-run)
"imap <buffer> <M-r> <Plug>(seeing-is-believing-run)

"nmap <buffer> <M-m> <Plug>(seeing-is-believing-mark)
"xmap <buffer> <M-m> <Plug>(seeing-is-believing-mark)
"imap <buffer> <M-m> <Plug>(seeing-is-believing-mark)

" Terminal
"nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
"xmap <buffer> <F5> <Plug>(seeing-is-believing-run)
"imap <buffer> <F5> <Plug>(seeing-is-believing-run)

"nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
"xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
"imap <buffer> <F4> <Plug>(seeing-is-believing-mark)

"Custom test script
function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !clear
  if match(a:filename, '\.feature$') != -1
    exec ":!bundle exec cucumber " . a:filename
  elseif match(a:filename, '_test\.rb$') != -1
    if filereadable("bin/testrb")
      exec ":!bin/testrb " . a:filename
    else
      exec ":!ruby -Itest " . a:filename
    end
  else
    if filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

function! SetTestFile()
  " set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! CorrectTestRunner()
  if match(expand('%%'), '\.feature$') != -1
    return "cucumber"
  elseif match(expand('%%'), '_spec\.rb$') != -1
    return "rspec"
  endif
endfunction

function! RunCurrentLineInTest()
  execute "!" . CorrectTestRunner() expand('%%:p') . ":" . line(".")
endfunction

" run test runner
map <leader>t :call RunTestFile()<cr>
map <leader>nt :call RunNearestTest()<cr>
map <leader>st :call RunCurrentLineInTest()<cr>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Correct backspace
set backspace=indent,eol,start

"setup ctrp-cmatcher
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
