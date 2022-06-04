--              *
--         *                *
--         _..._      *
--       .'     '.      _
--   *  /    .-""-\   _/ \
--    .-|   /:.   |  |   |
--    |  \  |:.   /.-'-./
--    | .-'-;:__.'    =/
--    .'=  *=|NVIM _.='
--   /   _.  |INIT ;
--  ;-.-'|    \   |     *
--  |  | \    _\  _\
--  |_/'._;.  ==' ==\     *
--          \    \   |
--          /    /   / *
--    *     /-._/-._/
--        * \   `\  \
--           `-._/._/
--
local present, impatient = pcall(require, "impatient")
if present then
	impatient.enable_profile()
end

-- Basic
require "shub.options"
require "shub.keymaps"
require "shub.autocmds"

-- Plugin confings
require "shub.plugins"
require "shub.lsp"
require "shub.cmp"
require "shub.config.colorscheme"
