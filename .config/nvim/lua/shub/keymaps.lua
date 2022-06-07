local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local map = vim.api.nvim_set_keymap

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- no comments wen going on new line

-- some utilily maps
map("n", "<C-s>", ":w<CR>", opts)

-- save file as sudo on files that require root permission
-- map("c", "w!!", "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!", opts)

-- Cute tricks
map("n", "<esc>", ":noh<CR><ESC>", opts)
map("n", "Y", "y$", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- move selected lines.
map("n", "J", ":move .+1<CR>==", opts)
map("n", "K", ":move .-2<CR>==", opts)
-- map("v", "J", ":move '>+1<CR>gv=gv", opts)
-- map("v", "K", ":move '<-2<CR>gv=gv", opts)

-- avoid yanked buffer change after paste
map("v", "p", '"_dP', opts)

-- File explorer
map("n", "<leader>e", ":Lex 30<cr>", opts)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Delete current buffer
map("n", "<leader>d", ":bdelete<CR>", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- complete braces, paranthesis => use auto-pairs
-- map("i", "{<CR>", "{<CR>}<Esc>O", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
map("i", "<C-Up>", ":resize +2<CR>", opts)
map("i", "<C-Down>", ":resize -2<CR>", opts)
map("i", "<C-Left>", ":vertical resize -2<CR>", opts)
map("i", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("v", "J", ":m .+1<CR>==", opts)
map("v", "K", ":m .-2<CR>==", opts)

-- open current file in browser
map("n", "<leader>w", ":exe ':silent !brave %'<CR>", opts)

-- dot commands on visual blocks
map("v", ".", ":normal .<C>", opts)

-- Splits
map("n", "<leader>v", ":vsplit<CR>", opts)
map("n", "<leader>h", ":split<CR>", opts)

-- Terminal --
map("n", "<leader>z", ":14sp +terminal<CR>i", opts)

-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- jump to tab using leader and tab number
map("n", "<leader>1", "1gt", opts)
map("n", "<leader>2", "2gt", opts)
map("n", "<leader>3", "3gt", opts)
map("n", "<leader>4", "4gt", opts)
map("n", "<leader>5", "5gt", opts)
map("n", "<leader>6", "6gt", opts)
map("n", "<leader>7", "7gt", opts)
map("n", "<leader>8", "8gt", opts)
-- map("n", "<C-w>", "tabclose", opts)

-- tab does not work in vim :(
-- map("n", "<C-tab>", ":tabn<CR>", opts)
-- map("n", "<C-S-tab>", ":tabp<CR>", opts)

-- Telescope
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- map("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
map("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>c", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>", opts)

-- nvim treep
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- command line commands
map("c", "w!!", ":write !sudo tee  > /dev/null %", opts)

-- Prettify code
map("n", "<leader>p", "<cmd>Format<cr>", opts)

-- toggle statusbar
