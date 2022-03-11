let mapleader=" "

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	""autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'lukesmithxyz/vimling'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'gioele/vim-autoswap'
" treesitters
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'glepnir/lspsaga.nvim'
" completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
""Plug 'hrsh7th/cmp-vsnip'
""Plug 'hrsh7th/vim-vsnip'
" ui
Plug 'gruvbox-community/gruvbox'
" Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' }
" If you want to display icons, then use one of these plugins:
" Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

" colorsceme
let g:gruvbox_italic=1
colorscheme gruvbox

""autocmd vimenter * ++nested colorscheme gruvbox
""autocmd vimenter * colorscheme gruvbox
""let g:gruvbox_contrast_dark = 'medium'

" let g:gruvbox_termcolors
""let g:gruvbox_invert_selection='0'

""set darker bg
set title
set bg=dark
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set shortmess+=A

" open file in browser
nnoremap <leader>w :exe ':silent !brave %'<CR>

" switch semi and colon ok
""nnoremap ; :
""nnoremap : ;

" highlighting stuff (for more groups=> :hi) :
	" set hlsearch
	" hi Search ctermfg=black ctermbg=Red
	" hi Visual ctermfg=black ctermbg=white
	" hi MatchParen cterm=bold,reverse ctermfg=Black
	" hi CursorLine cterm=NONE ctermbg=black ctermfg=DarkRed
	" hi Folded ctermfg=7 ctermbg=242
	" hi FoldColumn ctermfg=7
	" hi SyntasticError ctermfg=red
	" hi SyntasticWarning ctermfg=red

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber


" cute tricks
	nnoremap <silent> <esc> :noh<cr><esc>
	nnoremap Y y$
	nnoremap n nzzzv
	nnoremap N Nzzzv
	inoremap , ,<c-g>u
	inoremap . .<c-g>u
	inoremap { {<c-g>u
	inoremap } }<c-g>u
	inoremap [ [<c-g>u
	inoremap ] ]<c-g>u
	inoremap ? ?<c-g>u
	vnoremap H ^
	vnoremap L $
	vnoremap J :m '>+1<CR>gv=gv
	vnoremap K :m '<-2<CR>gv=gv


" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<C>
" Goyo plugin makes text more readable when writing prose:
"	map <leader>g :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
"	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

"""""""""""""
" Nerd tree "
"""""""""""""
	nnoremap <silent> <leader>n :NERDTreeToggle<CR>
	" autocmd VimEnter * NERDTree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif


" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	" map <C-k> <C-w>k
	map <C-l> <C-w>l

"  Control i for prev buff
" "map <silent> <C-i> :bp<CR>

" Split resizing
nnoremap <C-Left> <cmd>vertical resize +3<CR>
nnoremap <C-Right> <cmd>vertical resize -3<CR>
nnoremap <C-Up> <cmd>resize +3<CR>
nnoremap <C-Down> <cmd>resize -3<CR>
inoremap <C-Left> <cmd>vertical resize +3<CR>
inoremap <C-Right> <cmd>vertical resize -3<CR>
inoremap <C-Up> <cmd>resize +3<CR>
inoremap <C-Down> <cmd>resize -3<CR>

" Replace ex mode with gq
	map Q gq

" UNUSED
" Check file in shellcheck:
	" map <leader>s :!clear && shellcheck -x %<CR>

" vimling:
" nm <leader><leader>d :call ToggleDeadKeys()<CR>
" imap <leader><leader>d <esc>:call ToggleDeadKeys()<CR>a
" nm <leader><leader>i :call ToggleIPA()<CR>
" imap <leader><leader>i <esc>:call ToggleIPA()<CR>a
" nm <leader><leader>q :call ToggleProse()<CR>

" Open my bibliography file in split
	"map <leader>b :vsp<space>$BIB<CR>
	"map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	" nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	" map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
	" map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	" autocmd VimLeave *.tex !texclear %

" Enable Goyo by default for mutt writing
	""autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	""autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	""autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	""autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	" map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	""autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	""autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	""autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save and Save-as
	map <C-s> :w<CR>

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Start NERDTree when Vim is started without file arguments.
	""autocmd StdinReadPre * let s:std_in=1
	""autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif


" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

" Recompile dwm on config edit. Caution: THIS WILL LOGOUT YOUR SESSION
	autocmd BufWritePost ~/.local/src/dwm/config.h !cd ~/.local/src/dwm/; sudo make install; notify-send "dwm : Logout to see changes"

" Recompile st on config edit.
	autocmd BufWritePost ~/.local/src/st/config.h !cd ~/.local/src/st/; sudo make install && { setsid -f st }

" Recompile dwmblocks on config edit.
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <silent> <leader>b :call ToggleHiddenAll()<CR>

" Auto Complete braces, paranthesis, etc
	inoremap ( ()<Esc>i
	inoremap { {}<Esc>i
	inoremap [ []<Esc>i
	" inoremap < <><Esc>i
	inoremap ' ''<Esc>i
	inoremap " ""<Esc>i
	inoremap {<CR> {<CR>}<Esc>O

" Jump to tab using leader and tab number
" example:
 	nnoremap <leader>1 1gt
 	nnoremap <leader>2 2gt
 	nnoremap <leader>3 3gt
 	nnoremap <leader>4 4gt
 	nnoremap <leader>5 5gt
 	nnoremap <leader>6 6gt
 	nnoremap <leader>7 7gt
 	nnoremap <leader>8 8gt
 	nnoremap <leader>9 9gt
 	nnoremap <leader>0 :tablast<cr>

" <tab> / <s-tab> | Circular windows navigation
nnoremap <leader>t :tabnew<CR>
" nnoremap <tab> :tabn<cr> --this breaks <C-I>
nnoremap <S-tab> :tabp<cr>

" remember the folds and prev state
set viewoptions=folds,cursor
set sessionoptions=folds
augroup SaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  " BufHidden for compatibility with `set hidden`
  autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

" terminal2
nmap <silent> <Leader>z :14sp +terminal<CR> i
tnoremap <Esc><Esc> <C-\><C-n>
tnoremap <Leader>q <C-\><C-n>:q<CR>

" >> Lsp key bindings
nnoremap <silent>   <Leader>gd	<cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>   <Leader>gr 	<cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent>   <Leader>gf  <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent>   <Leader>dh 	<cmd>lua vim.lsp.buf.document_highlight()<CR>
nnoremap <silent>   <Leader>di 	<cmd>lua vim.lsp.buf.document_implementation()<CR>
nnoremap <silent> 	[d 	<cmd>lua vim.lsp.diagnostic.goto_prev({enable_popup = false})<CR>
nnoremap <silent> 	]d 	<cmd>lua vim.lsp.diagnostic.goto_next({enable_popup = false})<CR>

nnoremap <silent>   <Leader>cr    <cmd>Lspsaga rename<CR>
nnoremap <silent>   <Leader>ch 	  <cmd>Lspsaga hover_doc<CR>
nnoremap <silent>   <Leader>cs 	  <cmd>Lspsaga signature_help<CR>
nnoremap <silent>   <leader>cd    <cmd>Lspsaga show_line_diagnostics<CR>
nnoremap <silent>   <leader>ca    <cmd>Lspsaga code_action<CR>
" autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics()
""nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
""nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
""nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>

call sign_define("LspDiagnosticsSignError",{"text" : "", "texthl" : "RedSign"})
call sign_define("LspDiagnosticsSignWarning",{"text" : "", "texthl" : "YellowSign"})
call sign_define("LspDiagnosticsSignInformation",{"text" : "", "texthl" : "BlueSign"})
call sign_define("LspDiagnosticsSignHint",{"text" : "", "texthl" : "AquaSign"})

" >> Telescope bindings
nnoremap <Leader>ff <cmd>lua require'telescope.builtin'.find_files{ hidden =true }<CR>
nnoremap <Leader>tj <cmd>lua require'telescope.builtin'.builtin{}<CR>
nnoremap <Leader>fo <cmd>lua require'telescope.builtin'.oldfiles{}<CR>
nnoremap <Leader>fb <cmd>lua require'telescope.builtin'.buffers{}<CR>
nnoremap <Leader>fcb <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>
nnoremap <Leader>fm <cmd>lua require'telescope.builtin'.marks{}<CR>
nnoremap <Leader>fg <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <Leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <Leader>fc <cmd>lua require'telescope.builtin'.colorscheme{}<CR>

lua << EOF
require("shub")
EOF

" enable treesitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

" ==== utlisnips ==== Trigger configuration.
let g:UltiSnipsExpandTrigger='<C-s>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
let g:UltiSnipsRemoveSelectModeMappings = 0
" let g:UltiSnipsListSnippets = '<leader>us'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
