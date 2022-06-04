-- help -> https://github.com/Conni2461/dotfiles/blob/master/.config/nvim/lua/module/telescope.lua
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
telescope.load_extension "media_files"

telescope.setup {
  defaults = {
    prompt_prefix = "  ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        -- overrides
        ["<esc>"] = actions.close,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-h>"] = actions.select_horizontal,

        -- remember
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

    },
  },
    pickers = {
        current_buffer_fuzzy_find = {
            theme = "dropdown",
            previewer = false,
        }
    },
    extensions = {

        fzf = {
            fuzzy = true,
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- "smart_case" | "ignore_case" | "respect_case"
        },
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = {"png", "webp", "jpg", "jpeg"},
          find_cmd = "rg" -- find command (defaults to `fd`)
        }
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
    },
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
-- telescope.load_extension "fzf"
