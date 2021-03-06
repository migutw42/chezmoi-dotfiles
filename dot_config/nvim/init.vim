" plugins {{{1
call plug#begin('~/.config/nvim/plugged')

Plug 'voldikss/vim-floaterm'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'

Plug 'lambdalisue/gina.vim'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'w0ng/vim-hybrid'

Plug 'tyru/caw.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'easymotion/vim-easymotion'
Plug 'danilamihailov/beacon.nvim'
Plug 'TaDaa/vimade'

Plug 'vim-test/vim-test'
Plug 'puremourning/vimspector'
Plug 'liuchengxu/vista.vim'
Plug 'iberianpig/tig-explorer.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'junegunn/goyo.vim'

Plug 'lambdalisue/fern.vim'
Plug 'yuki-yano/fern-preview.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'

Plug 'ryanoasis/vim-devicons'


Plug 'moll/vim-bbye'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'dart-lang/dart-vim-plugin'
Plug 'rust-lang/rust.vim'
Plug 'dag/vim-fish'
Plug 'elixir-editors/vim-elixir'
Plug 'andys8/vim-elm-syntax'
Plug 'thosakwe/vim-flutter'


call plug#end()

let g:coc_global_extensions = [
      \  'coc-yank'
      \, 'coc-tsserver'
      \, 'coc-snippets'
      \, 'coc-prettier'
      \, 'coc-pairs'
      \, 'coc-highlight'
      \, 'coc-fzf-preview'
      \, 'coc-rust-analyzer'
      \, 'coc-elixir'
      \, 'coc-flutter'
      \, ]

" editor {{{1
set termguicolors

set number
set expandtab
set tabstop=2
set shiftwidth=2
set noswapfile
set cursorline
set cursorcolumn
set showtabline=2
" set mouse=a

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

colorscheme hybrid


" keybinding {{{1
let mapleader = "\<Space>"

imap <silent> <c-a> <c-o>I
imap <silent> <c-e> <c-o>A
imap <silent> <c-u> <c-o>dd
cmap <c-a> <home>
cmap <c-e> <end>
nmap <c-a> 0
nmap <c-e> $
vmap <c-a> 0
vmap <c-e> $

nnoremap <silent> gj G
nnoremap <silent> gk gg
nnoremap <silent> <leader>t :ene<CR>
nnoremap <silent> <leader>q :call CloseBuffer()<CR>
nnoremap <silent> <leader><leader>q :q<CR>
nnoremap <silent> <leader><leader><leader>q <C-w>q

inoremap <silent> qq <esc>

nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l
nnoremap <silent> <leader>s <C-w>s<C-w>j
nnoremap <silent> <leader>v <C-w>v<C-w>l
nnoremap <silent> <leader>w <C-w>w

noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <esc>:update<CR>

" copy to clipboard
vnoremap <silent> <leader>y "+y
" paste from clipboard
nnoremap <silent> <leader>p "+p
nnoremap <silent> <leader>P "+P

nnoremap <silent> <esc><esc> :nohl<CR>
nnoremap <silent> gn :bnext<CR>
nnoremap <silent> gb :bprevious<CR>
nnoremap <silent> K :bnext<CR>
nnoremap <silent> J :bprevious<CR>


function! g:CloseBuffer()
  if stridx(bufname("%"), "fern://drawer") == 0 
    execute "FernDo close"
  else
    execute "Bdelete"
  endif
endfunc

" folding {{{1
augroup folding
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" vim-airline {{{1
let g:airline_theme = 'hybrid'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" fzf {{{1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let g:fzf_preview_filelist_command = 'fd -H -E .git'
let g:fzf_preview_use_dev_icons = 1

nnoremap <silent> <leader>f :<C-u>CocCommand fzf-preview.ProjectFiles<CR> 
nnoremap <silent> <leader>F :<C-u>CocCommand fzf-preview.DirectoryFiles<CR> 
nnoremap <silent> <leader><leader>f :<C-u>CocCommand fzf-preview.DirectoryFiles<CR> 
nnoremap <silent> <leader>r :<C-u>CocCommand fzf-preview.ProjectMruFiles<CR> 
nnoremap <silent> <leader><leader>r :<C-u>CocCommand fzf-preview.CommandPalette<CR> 
nnoremap <silent> <leader>b :<C-u>CocCommand fzf-preview.Buffers<CR> 
nnoremap <silent> <leader>/ :<C-u>CocCommand fzf-preview.Lines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'"<CR> 
nnoremap <silent> <leader><leader>/ :<C-u>CocCommand fzf-preview.ProjectGrep<Space> 
nnoremap <silent> <leader>? :<C-u>CocCommand fzf-preview.ProjectGrep<Space> 
nnoremap <silent> <leader>c :<C-u>Commands<CR>
nnoremap <silent> <leader>C :<C-u>CocFzfList<CR>
nnoremap <silent> <leader><leader>c :<C-u>CocFzfList<CR>
nnoremap <silent> <leader>g :<C-u>CocCommand fzf-preview.GitStatus<CR> 
nnoremap <silent> <leader>G :<C-u>CocCommand fzf-preview.GitActions<CR> 
nnoremap <silent> <leader><leader>g :<C-u>CocCommand fzf-preview.GitActions<CR> 
nnoremap <silent> <leader>d :<C-u>CocCommand fzf-preview.CocDiagnostics<CR> 
nnoremap <silent> <leader><leader>d :<C-u>CocCommand fzf-preview.CocDiagnostics<CR> 
nnoremap <silent> <leader>r :<C-u>CocCommand fzf-preview.ProjectMruFiles<CR> 
nnoremap <silent> <leader>b :<C-u>CocCommand fzf-preview.Buffers<CR> 
nnoremap <silent> <leader>/ :<C-u>CocCommand fzf-preview.Lines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'"<CR> 
nnoremap <silent> <leader>? :<C-u>CocCommand fzf-preview.ProjectGrep<Space> 
nnoremap <silent> <leader>c :Commands<CR>
nnoremap <silent> <leader>C :CocFzfList<CR>
nnoremap <silent> <leader><leader>c :CocFzfList<CR>
nnoremap <silent> <leader>g :CocCommand fzf-preview.GitActions<CR> 
nnoremap <silent> <leader>G :CocCommand fzf-preview.GitStatus<CR> 
nnoremap <silent> <leader><leader>g :CocCommand fzf-preview.GitStatus<CR> 

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

function! s:fzfQuickAction()
  let list = [
  \  'Format'
  \, 'Import'
  \, 'ene'
  \, ]

 call fzf#run({
  \ 'source': list,
  \ 'sink*': function('execute'),
  \ 'window': g:fzf_layout['window'],
  \ })
endfunction

command! -nargs=0 FzfQuickAction :call s:fzfQuickAction()
nnoremap <silent> <leader><leader>. :FzfQuickAction<CR> 


" coc.nvim {{{1
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> H :call <SID>show_documentation()<CR>

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
nmap <leader>R <Plug>(coc-rename)

" Codeaction
nmap <leader>. <Plug>(coc-codeaction)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 Import :call CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Fern {{{1
nnoremap <silent> <leader>e :Fern . -reveal=%<CR>
nnoremap <silent> <leader><leader>e :Fern . -drawer -reveal=% -toggle<CR>
let g:fern#renderer = "nerdfont"
let g:fern#default_hidden = 1

function! s:init_fern_mapping_preview() abort
    nmap <buffer> p <Plug>(fern-action-preview:toggle) 
endfunction
augroup my-fern-mapping-preview
    autocmd! *
    autocmd FileType fern call s:init_fern_mapping_preview()
augroup END


" Fcitx {{{1
if executable('fcitx')
   autocmd InsertLeave * :call system('fcitx-remote -c')
   autocmd CmdlineLeave * :call system('fcitx-remote -c')
endif

" TypeScript {{{1
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Vista {{{1
nnoremap <silent> <leader><leader>v :Vista coc<CR>

" EasyMotion{{{1
nmap s <Plug>(easymotion-overwin-f2)
map <leader><leader>l <Plug>(easymotion-bd-jk)
nmap <leader><leader>l <Plug>(easymotion-overwin-line)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1

" Plug {{{1
autocmd VimEnter *
  \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall
  \| endif
