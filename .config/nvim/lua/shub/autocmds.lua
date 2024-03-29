local autocmd = vim.api.nvim_create_autocmd
local keymap = vim.api.nvim_buf_set_keymap

-- run python code
vim.api.nvim_create_autocmd('FileType',
    {
        pattern = { "python" },
        callback = function()
            vim.cmd [[
                nnoremap <silent> <buffer> <leader>r :term python3 %<CR> :startinsert<CR>
            ]]
        end,
})

-- run C code
vim.api.nvim_create_autocmd('FileType',
    {
        pattern = { "c" },
        callback = function()
            vim.cmd [[
                nnoremap <silent> <buffer> <leader>r :term gcc %
            ]]
        end,
})

-- run cpp code
vim.api.nvim_create_autocmd('FileType',
    {
        pattern = { "cpp" },
        callback = function()
            vim.cmd [[
            nnoremap <silent> <buffer> <leader>r :term g++ % && ./a.out<CR>i
            ]]
        end,
})

vim.api.nvim_create_autocmd('FileType',
    {
        pattern = { "sh" },
        callback = function()
            vim.cmd [[
                nnoremap <silent> <buffer> <leader>r :term bash %<CR> :startinsert<CR>
            ]]
        end,
})

-- clean terminal
autocmd('TermOpen',
    {
        callback = function()
        	vim.o.number = false
        	vim.o.relativenumber = false
--      	vim.cmd "startinsert"
	    end,
    })

-- clear whitespaces and blank lines on save
autocmd('BufWritePre',
    {
        pattern = '*',
        command =  [[
                %s/\s\+$//e
                %s/\n\+\%$//e
        ]],
    })
autocmd('BufWritePre',
    {
        pattern = '*.[ch]',
        command =  [[ %s/\%$/\r/e ]],
    })

-- highlight on yank
-- autocmd("TextYankPost",
--     {
--         callback = function()
--           vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
--         end,
--     })

-- close some buffers using 'q'
autocmd( "FileType",
    {
		pattern = {"checkhealth", "fugitive", "git*", "help", "lspinfo"},
		callback = function ()
			-- vim.api.nvim_win_close(0, true) -- TODO: Replace vim command with this
			keymap(0, "n", "q", "<cmd>close!<cr>", { noremap = true, silent = true })
		end
    })


-- When shortcut files are updated, renew bash and other configs with new material:
autocmd("BufWritePost",
    {
        pattern = { "bm-files", "bm-dirs" },
        command = [[ !shortcuts ; notify-send "Shortcuts Updated!😀"]],
    })

-- save folds. TODO: convert to lua
vim.cmd([[
augroup SaveFolds
  autocmd!
  autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end
]])
-- make dwm after config is edited
vim.cmd ([[
	autocmd BufWritePost ~/.local/src/dwm/config.h !cd ~/.local/src/dwm/; sudo make install; notify-send "dwm : Logout to see changes"
]])
-- make dwmblocks after config is edited
vim.cmd ([[
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install; notify-send "dwmblocks : Logout to see changes"
]])
