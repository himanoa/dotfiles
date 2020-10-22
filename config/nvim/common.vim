set autoread
set termguicolors
set number
set relativenumber
set encoding=utf-8
set fileencoding=utf-8
set showmatch
set clipboard+=unnamedplus
set noswapfile
set expandtab
set tabstop=2
set softtabstop=2
set smartindent
set autoindent
set shiftwidth=2
set incsearch
set inccommand=split
set noshowmode
set spelllang+=cjk
set ttyfast
set lazyredraw
set pumblend=20
set winblend=20
set wildoptions=pum
augroup Spell
  autocmd!
  autocmd Filetype markdown set spell
  autocmd Filetype gitcommit set spell
augroup END

noremap <SPACE>, :noh<CR>

noremap s> <C-w>>
noremap s< <C-w><
noremap s[ <C-w>+
noremap s] <C-w>-
noremap th gT
noremap tl gt

noremap ; :
noremap X :w<CR>
noremap <C-o> ma<C-o>
tnoremap <ESC> <C-\><C-n>
inoremap <S-Tab> <C-d>
syntax on
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" hi clear SpellBad
" hi SpellBad cterm=underline
" hi clear SpellCap
" hi SpellCap cterm=underline,bold
" :highlight LineNr ctermfg=1
" au BufNewFile,BufRead *.tag setf pug
" colorscheme default
" hi Cursorline ctermfg=0 ctermbg=130 gui=bold,reverse guifg=Sienna4 guibg=White

filetype plugin indent on
syntax enable
augroup MyVimrc
  autocmd!
augroup END
autocmd MyVimrc FileType yaml setlocal foldmethod=syntax
setlocal signcolumn=yes
" set bg=light
" colorscheme iceberg

let g:terminal_color_0  = "#1b2b34" "black
let g:terminal_color_1  = "#ed5f67" "red
let g:terminal_color_2  = "#9ac895" "green
let g:terminal_color_3  = "#fbc963" "yellow
let g:terminal_color_4  = "#669acd" "blue
let g:terminal_color_5  = "#c695c6" "magenta
let g:terminal_color_6  = "#5fb4b4" "cyan
let g:terminal_color_7  = "#c1c6cf" "white
let g:terminal_color_8  = "#65737e" "bright black
let g:terminal_color_9  = "#fa9257" "bright red
let g:terminal_color_10 = "#9ac895" "bright green
let g:terminal_color_11 = "#fbc963" "bright yellow
let g:terminal_color_12 = "#669acd" "bright blue
let g:terminal_color_13 = "#c695c6" "bright magenta
let g:terminal_color_14 = "#5fb4b4" "bright cyan
let g:terminal_color_15 = "#c1c6cf" "bright white
let g:terminal_color_background="#F6F6F6" "background
nmap <C-E> [winsize]
nnoremap [winsize]k :resize -3<CR>
nnoremap [winsize]j :resize +3<CR>
nnoremap [winsize]h :vertical resize +10<CR>
nnoremap [winsize]l :vertical resize -10<CR>et g:terminal_color_foreground="#c1c6cf" "foreground
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

if system('uname -a | grep microsoft') != ""
  let g:clipboard = {
        \   'name': 'myClipboard',
        \   'copy': {
        \      '+': 'win32yank.exe -i',
        \      '*': 'win32yank.exe -i',
        \    },
        \   'paste': {
        \      '+': 'win32yank.exe -o',
        \      '*': 'win32yank.exe -o',
        \   },
        \   'cache_enabled': 1,
        \ }
endif
autocmd bufWritePre * :silent! %s/\r//g
au CursorHold,CursorHoldI * checktime
:highlight LineNr guifg=#fff

colorscheme nisha
highlight DiffAdd guifg=NONE guibg=#334539
highlight DiffChange guifg=NONE guibg=#334539
highlight DiffDelete guifg=NONE guibg=#45333a
highlight DiffText guifg=NONE guibg=#5f5d42
highlight DiffLine guifg=NONE guibg=#8fa1b3
