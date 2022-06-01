local options = {
    backup = false,                          -- creates a backup file
    bg = "dark",
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cursorline = true,
    cmdheight = 1,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
--  colorcolumn = "80",                      -- Set 80 character limit line
    expandtab = true,                        -- convert tabs to spaces
    fileencoding = "utf-8",                  -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,                       -- ignore case in search patterns
    laststatus = 3,                          -- Universal status bar
    mouse = "a",                             -- allow the mouse to be used in neovimA
    number = true,                           -- set numbered lines
    numberwidth = 4,                         -- set number column width to 2 {default 4}
    pumheight = 10,                          -- pop up menu height
    relativenumber = true,                   -- set relative numbered lines
--  ruler = false,
--  showcmd = false,
    showmode = false,
    showtabline = 1,
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    scrolloff = 6,                           -- prevent ctrl-u and ctrl-d from keeping your cursor top or bottom
    sidescrolloff = 8,
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    swapfile = false,                        -- creates a swapfile
    title = true,
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    tabstop = 4,                             -- insert 4 spaces for a tab
    undofile = true,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default). Also used for CursorHold event
    viewoptions = { "folds", "cursor"},
    sessionoptions = "folds",
    wrap = false,                            -- display lines as one long line
--guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "cA"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]
