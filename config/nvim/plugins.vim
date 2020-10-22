call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'rhysd/clever-f.vim'
Plug 'freeo/vim-kalisi'
Plug 'cohama/lexima.vim'
Plug 'Shougo/denite.nvim'
Plug 'cocopon/iceberg.vim'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}

Plug 'tpope/vim-fugitive'

Plug 'Shougo/neomru.vim'

Plug 'jceb/vim-hier'

Plug 'tmsanrinsha/yaml.vim'

Plug 'kana/vim-textobj-user'

Plug 'kana/vim-operator-user'
Plug 'tyru/operator-camelize.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'sgur/vim-textobj-parameter'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'junegunn/fzf'
Plug 'rhysd/vim-operator-surround'
Plug 'mattn/emmet-vim', { 'for': ['html', 'vue'] }
Plug 'airblade/vim-gitgutter'
Plug 'posva/vim-vue'
Plug 'reedes/vim-colors-pencil'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-endwise'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'lambdalisue/fern.vim' 
Plug 'junkblocker/patchreview-vim'
Plug 'chemzqm/denite-git'
Plug 'tyru/eskk.vim'
Plug 'himanoa/goshiteki'
Plug 'ruanyl/vim-gh-line'
Plug 'knsh14/vim-github-link'
Plug 'heraldofsolace/nisha-vim'
Plug 'jparise/vim-graphql'
" Initialize plugin system
call plug#end()

function! s:denite_config()
  autocmd FileType denite call s:denite_buffer_keymaps()
  function! s:denite_buffer_keymaps() abort
    nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
    \ denite#do_map('toggle_select').'j'
  endfunction
  noremap <silent> <Space>m :<C-u>Denite  file_mru<CR>
  call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
  noremap <silent> <Space>f :<C-u>Denite  file/rec<CR>
  noremap <silent> <Space>fs :<C-u>Denite  -path=src file/rec<CR>
  noremap <silent> <Space>fa :<C-u>Denite  -path=app file/rec<CR>
  noremap <silent> <Space>fc :<C-u>call denite#helper#call_denite('Denite', '-path=' . expand('%:h') . ' file' . ' file:new', '', '')<CR>
  noremap <silent> <Space>g :<C-u>Denite  grep<CR>
  noremap <silent> <Space>l :<C-u>Denite  line<CR>
  noremap <silent> <Space>y :<C-u>Denite  neoyank<CR>
  noremap <silent> <Space>b :<C-u>Denite  buffer<CR>
  noremap <silent> <Space>u :<C-u>Denite  -resume <CR>
  noremap <silent> <C-n> :<C-u>Denite file file:new <CR>
  noremap <silent> <C-b> :<C-u>Denite  buffer<CR>
endfunction

function! s:coc_config()
  " TextEdit might fail if hidden is not set.
  set hidden

  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  if has('patch8.1.1068')
    " Use `complete_info` if your (Neo)Vim version supports it.
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current line.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Introduce function text object
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " Use <TAB> for selections ranges.
  " NOTE: Requires 'textDocument/selectionRange' support from the language server.
  " coc-tsserver, coc-python are the examples of servers that support it.
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings using CoCList:
  " Show all diagnostics.
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
endfunction

function! s:ale_config()
  let l:existConfig = 0
  let l:prettierrcs = [".prettierrc", ".prettierrc.toml", ".prettierrc.config.js", ".prettierrc.js"]
  for item in l:prettierrcs
    let l:existConfig = l:existConfig + filereadable(item)
  endfor
  let g:ale_fixers = {
        \ 'javascript': ['eslint'],
        \ 'typescript': ['eslint'],
        \ 'typescriptreact': ['eslint'],
        \ 'vue': ['eslint'],
        \ 'php': ['php_cs_fixer'],
        \ 'ruby': ['rubocop']
        \ }
  let g:ale_fix_on_save = 1
  if l:existConfig > 0
    call insert(g:ale_fixers.javascript, "prettier")
    call insert(g:ale_fixers.typescript, "prettier")
    call insert(g:ale_fixers.vue, "prettier")
  endif
endfunction

function! s:operator_camelize_config()
  map ct  <Plug>(operator-camelize-toggle)
endfunction

function! s:operator_surround_config()
  map <silent> sa <Plug>(operator-surround-append)
  map <silent> sd <Plug>(operator-surround-delete)
  map <silent> sr <Plug>(operator-surround-replace)
endfunction

function! s:memolist_config()
  nnoremap <Leader>mn  :MemoNew<CR>
  nnoremap <Leader>ml  :MemoList<CR>
  nnoremap <Leader>mg  :MemoGrep<CR>
endfunction

function! s:emmet_config()
  let g:user_emmet_leader_key = '<C-e>'
  let g:user_emmet_install_global = 1
endfunction

function! s:vim_bufkill()
  command! WBD write | BD
endfunction

function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
endfunction

function! s:fern_config()
  augroup fern-custom
    autocmd! *
    autocmd FileType fern call s:init_fern()
  augroup END
endfunction

function! s:eskk_config()
  let g:eskk#dictionary = {
  \ 'path': "/Users/himanoa/Library/Application\ Support/AquaSKK/skk-jisyo.utf-8",
  \ 'encoding': 'utf-8'
  \}

	let g:eskk#large_dictionary = {
	\	'path': "/Users/himanoa/Documents/SKK-JISYO.L",
	\	'sorted': 1,
	\	'encoding': 'euc-jp',
	\}
endfunction

call s:ale_config()
call s:operator_surround_config()
call s:operator_camelize_config()
call s:denite_config()
call s:coc_config()
call s:memolist_config()
call s:emmet_config()
call s:fern_config()
if has('macunix')
  call s:eskk_config()
endif

