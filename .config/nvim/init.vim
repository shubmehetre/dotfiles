let mapleader=";"

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
" Plug 'neoclide/coc.nvim'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'lukesmithxyz/vimling'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
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
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
" completion
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" ui
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'gruvbox-community/gruvbox'
" Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' }
" If you want to display icons, then use one of these plugins:
" Plug 'kyazdani42/nvim-web-devicons'
call plug#end()


" colorsceme
let g:gruvbox_italic=1
colorscheme gruvbox
autocmd vimenter * ++nested colorscheme gruvbox


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
	nnoremap Y y$					" works like D and C
	nnoremap n nzzzv				" keeps centre for searches
	nnoremap N Nzzzv
	inoremap , ,<c-g>u
	inoremap . .<c-g>u
	inoremap { {<c-g>u
	inoremap } }<c-g>u
	inoremap [ [<c-g>u
	inoremap ] ]<c-g>u
	inoremap ? ?<c-g>u
	vnoremap J :m '>+1<CR>gv=gv
	vnoremap K :m '<-2<CR>gv=gv

" configure expanding of tabs for various file types
""au BufRead,BufNewFile *.py set expandtab
""au BufRead,BufNewFile *.c set expandtab
""au BufRead,BufNewFile *.h set expandtab
""au BufRead,BufNewFile Makefile* set noexpandtab

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

" Nerd tree
	map <silent> <leader>n :NERDTreeToggle<CR>
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
	map <C-k> <C-w>k
	map <C-l> <C-w>l

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

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save and Save-as
	map <C-s> :w<CR>

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Start NERDTree when Vim is started without file arguments.
	""autocmd StdinReadPre * let s:std_in=1
	""autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Enable Goyo by default for mutt writing
	""autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	""autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	""autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	""autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

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
	inoremap < <><Esc>i
	inoremap ' ''<Esc>i
	inoremap " ""<Esc>i
	inoremap {<CR> {<CR>}<Esc>O

" Jump to tab using leader and tab number
" example:
 	noremap <leader>1 1gt
 	noremap <leader>2 2gt
 	noremap <leader>3 3gt
 	noremap <leader>4 4gt
 	noremap <leader>5 5gt
 	noremap <leader>6 6gt
 	noremap <leader>7 7gt
 	noremap <leader>8 8gt
 	noremap <leader>9 9gt
 	noremap <leader>0 :tablast<cr>
	nnoremap <leader>t :tabnew<CR>
" <tab> / <s-tab> | Circular windows navigation
nnoremap <tab> :tabn<cr>
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

" terminal
nmap <Leader>z :14sp +terminal<CR> i
tnoremap <Esc><Esc> <C-\><C-n>
tnoremap <Leader>q <C-\><C-n>:q<CR>

" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> K     <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>Lspsaga signature_help<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics()

""nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
""nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
""nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>

" >> Telescope bindings
nnoremap <Leader>pp <cmd>lua require'telescope.builtin'.builtin{}<CR>
" most recently used files
nnoremap <Leader>fo <cmd>lua require'telescope.builtin'.oldfiles{}<CR>
" find buffer
nnoremap , <cmd>lua require'telescope.builtin'.buffers{}<CR>
" find in current buffer
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>
" bookmarks
nnoremap <Leader>' <cmd>lua require'telescope.builtin'.marks{}<CR>
" git files
nnoremap <Leader>fg <cmd>lua require'telescope.builtin'.git_files{}<CR>
" all files
nnoremap <Leader>s <cmd>lua require'telescope.builtin'.find_files{}<CR>
" ripgrep like grep through dir
nnoremap <Leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>
" pick color scheme
nnoremap <Leader>cs <cmd>lua require'telescope.builtin'.colorscheme{}<CR>

" Split resizing
nnoremap <C-Left> <cmd>vertical resize +3<CR>
nnoremap <C-Right> <cmd>vertical resize -3<CR>
nnoremap <C-Up> <cmd>resize +3<CR>
nnoremap <C-Down> <cmd>resize -3<CR>
inoremap <C-Left> <cmd>vertical resize +3<CR>
inoremap <C-Right> <cmd>vertical resize -3<CR>
inoremap <C-Up> <cmd>resize +3<CR>
inoremap <C-Down> <cmd>resize -3<CR>

lua << EOF
require("shub")
EOF

" enable treesitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
""filetype indent plugin on
""set expandtab           " enter spaces when tab is pressed
""set smartindent
""set modeline
""set textwidth=80       " break lines when line length increases
""set tabstop=4           " use 4 spaces to represent tab
""set softtabstop=4
""set shiftwidth=4        " number of spaces to use for auto indent
""set autoindent          " copy indent from current line when starting a new line
""" make backspaces more powerfull
""set backspace=indent,eol,start
""" Tab settings for various files
""augroup TabSettings
""  autocmd!
""  autocmd FileType python setl ai ts=8 et sw=4 sts=4
""  autocmd FileType make         set sw=4 ts=4 noet
""  autocmd BufRead,BufNewFile *.conf,*.cfg setlocal filetype=config
""  autocmd FileType config       setlocal commentstring=#\ %s
""  autocmd FileType toml         setlocal commentstring=#\ %s
""  autocmd FileType terraform    setlocal commentstring=#\ %
""  ""autocmd FileType python       set ai et sw=4 ts=4 sts=4
""augroup END

" ==== Buffers ====
""set showtabline=1                     " show tabs only when 2 or more open
""""set noswapfile                        " Dont' use swapfile
""set shiftwidth=4                      " shift lines by 4 spaces
""set tabstop=4                         " 4 whitespaces for tabs visual presentation
""set smarttab                          " set tabs for a shifttabs logic
""set expandtab                         " expand tabs into spaces
""""set smartindent
""set shiftround                        " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
""
""" make backspaces more powerfull
""set backspace=indent,eol,start

""augroup TabSettings
""  autocmd!
""  " vim-commentary help
""  autocmd BufRead,BufNewFile *.conf,*.cfg setlocal filetype=config
""  autocmd FileType config       setlocal commentstring=#\ %s
""  autocmd FileType toml         setlocal commentstring=#\ %s
""  autocmd FileType terraform    setlocal commentstring=#\ %s
""
""  autocmd FileType python       setlocal ai et sw=4 ts=4 sts=4
""  autocmd FileType make         setlocal sw=4 ts=4 noet
""  autocmd FileType jinja        setlocal sw=0
""  autocmd FileType go           setlocal sw=8 ts=8 noet
""augroup END

"" Python
""au BufNewFile,BufRead *.py set colorcolumn=79
""au BufNewFile,BufRead *.py set shiftwidth=4
""au BufNewFile,BufRead *.py set softtabstop=4
""au BufNewFile,BufRead *.py set tabstop=4
""" au BufNewFile,BufRead *.py setlocal foldmethod=indent
""au BufNewFile,BufRead *.py vmap <CR> :s/\(^\s*\)/\1# /<CR>:let @/ = ""<CR>
""au BufNewFile,BufRead *.py vmap <S-CR> :s/\(^\s*\)# /\1/<CR>:let @/ = ""<CR>
