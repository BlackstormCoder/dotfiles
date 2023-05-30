vim.g.mapleader = " "

local all_modes = { 'n', 'i', 'v', 't' }
local exclude_t = { 'n', 'i', 'v' }
local exclude_i  = { 'n', 'v', 't' }
local n_v = { 'n', 'v' }
local n_t = { 'n', 't' }
local n = 'n'

-- Function to map keys.
local map_key = vim.keymap.set
-- Default config for the keymaps.
local default_settings = {
    noremap = true,
    silent = true,
}


map_key(exclude_t, '<F3>', '<Cmd>Telescope find_files<CR>', default_settings)

-- Toggle the file explorer.
function toggle_nvim_tree()
    require("nvim-tree.api").tree.toggle({})
    local is_open = require("nvim-tree.view").is_visible()
    -- if is_open then vim.wo.statuscolumn = ' ' end
end

map_key(all_modes, '<F2>', '<Cmd>lua toggle_nvim_tree()<CR>', default_settings)
map_key(n, '<Leader>f', '<Cmd>lua toggle_nvim_tree()<CR>', default_settings)

-- Grep for a string in the current directory.
map_key(exclude_t, '<F4>', '<Cmd>Telescope live_grep<CR>', default_settings)

-- Search for old files.
map_key(exclude_t, '<C-t>', '<Cmd>Telescope oldfiles<CR>', default_settings)

-- Cheatsheet.
map_key(all_modes, '<F12>', '<Cmd>Cheatsheet<CR>', default_settings)

-- Moving windows.
map_key(n_t, '<C-h>','<Cmd>wincmd h<CR>', default_settings)
map_key(n_t, '<C-j>','<Cmd>wincmd j<CR>', default_settings)
map_key(n_t, '<C-k>','<Cmd>wincmd k<CR>', default_settings)
map_key(n_t, '<C-l>','<Cmd>wincmd l<CR>', default_settings)

-- Resizing windows.
map_key(n_t, '<C-=>','<Cmd>vertical resize +5<CR>', default_settings)
map_key(n_t, '<C-->','<Cmd>vertical resize -5<CR>', default_settings)
map_key(n_t, '<C-+>','<Cmd>horizontal resize +5<CR>', default_settings)
-- map_key(n_t, '<C-_>','<Cmd>horizontal resize -5<CR>')

-- Commenting.
--map_key(exclude_t, '<C-/>', '<Cmd>call nerdcommenter#Comment(0, "toggle")<CR>', default_settings)
-- map_key(n_v, '<C-_>', ':call nerdcommenter#Comment(0, "toggle")<CR>' , default_settings)
map_key(n_v, '<C-/>', ':Commentary<CR>' , default_settings)


-- Functions that only saves buffers that has files.
function Save_file()
    -- local readonly = vim.api.nvim_buf_get_option(0, 'readonly')
    local modifiable = vim.api.nvim_buf_get_option(0, 'modifiable')
    -- local nofile = vim.api.nvim_buf_get_option(0, 'buftype') == 'nofile'
    if modifiable then
        vim.cmd 'w!'
    end
end

map_key(exclude_t, '<C-s>', '<Cmd>lua Save_file()<CR>', default_settings)

-- Buffers.
map_key(exclude_t, '<C-TAB>', '<Cmd>Telescope buffers<CR>', default_settings)

-- Finding.
map_key(n_v, '<C-f>', '<Cmd>Telescope current_buffer_fuzzy_find previewer=false<CR>', default_settings)

-- Disable the search highlight when hitting esc.
map_key(all_modes, '<Esc>', '<Cmd>noh<CR>', { noremap = false })

-- Undo.
map_key(exclude_t, '<C-Z>', '<Cmd>undo<CR>', default_settings)

-- Redo.
map_key(exclude_t, '<C-Y>', '<Cmd>redo<CR>', default_settings)


-- Better window navigation
map_key(exclude_t, "<C-h>", "<C-w>h", default_settings)
map_key(exclude_t, "<C-j>", "<C-w>j", default_settings)
map_key(exclude_t, "<C-k>", "<C-w>k", default_settings)
map_key(exclude_t, "<C-l>", "<C-w>l", default_settings)

-- Resize with arrows
map_key(exclude_t, "<C-Up>", ":resize -2<CR>", default_settings)
map_key(exclude_t, "<C-Down>", ":resize +2<CR>", default_settings)
map_key(exclude_t, "<C-Left>", ":vertical resize -2<CR>", default_settings)
map_key(exclude_t, "<C-Right>", ":vertical resize +2<CR>", default_settings)

-- Navigate buffers
map_key(exclude_i, "<S-l>", ":bnext<CR>", default_settings)
map_key(exclude_i, "<S-h>", ":bprevious<CR>", default_settings)
map_key(exclude_i, "<C-w>q", ":bdelete<CR>", default_settings)

-- Move text up and down
map_key(n, "<A-j>", "<Esc>:m .+1<CR>==", default_settings)
map_key(n, "<A-k>", "<Esc>:m .-2<CR>==", default_settings)


-- -- -- -- Visual --
-- -- -- Stay in indent mode
map_key("v", "<", "<gv", default_settings)
map_key("v", ">", ">gv", default_settings)
--
--   -- Move text up and down
map_key("v", "<A-j>", ":m .+1<CR>==", default_settings)
map_key("v", "<A-k>", ":m .-2<CR>==", default_settings)
-- map_key("v", "p", '"_dP', default_settings)
--
--   -- Visual Block --
--   -- Move text up and down
map_key("x", "J", ":move '>+1<CR>gv-gv", default_settings)
map_key("x", "K", ":move '<-2<CR>gv-gv", default_settings)
map_key("x", "<A-j>", ":move '>+1<CR>gv-gv", default_settings)
map_key("x", "<A-k>", ":move '<-2<CR>gv-gv", default_settings)
--
-- -- Terminal --
-- Better terminal navigation
map_key("t", "<C-h>", "<C-\\><C-N><C-w>h", default_settings)
map_key("t", "<C-j>", "<C-\\><C-N><C-w>j", default_settings)
map_key("t", "<C-k>", "<C-\\><C-N><C-w>k", default_settings)
map_key("t", "<C-l>", "<C-\\><C-N><C-w>l", default_settings)


-- Remain cursor at the same position after the deleting the new line
map_key("n", "J", "mzJ`z", default_settings)
map_key("n", "<C-d>", "<C-d>zz", default_settings)
map_key("n", "<C-u>", "<C-u>zz", default_settings)
map_key("n", "n", "nzzzv", default_settings)
map_key("n", "N", "Nzzzv", default_settings)

-- greatest remap ever
-- It will delete the word from the buffer and paste on the highlighted area so we wont lose our copied text
--
-- delete the word from the buffer to void and paste new word
map_key("x", "<leader>p", "\"_dP")

-- Delete the word from the buffer to void
-- map_key("n", "<leader>d", "\"_d")
map_key("n", "d", "\"_d")

-- This is going to get me cancelled
map_key("i", "<C-c>", "<Esc>", default_settings)
-- map_key("n", "Q", "<Cmd>noh<CR>")

-- map_key("n", "<C:F>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


map_key("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", default_settings)
map_key("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })



-- map_key("n", "<leader>f", "<cmd>FzfLua files <CR>", { silent = true })

-- map_key("n", "<c-P>", "<cmd>:lua require'fzf-lua'.files({ cwd = '/' } ) <CR>", default_settings)
-- map_key("n", "<c-P>", "<Cmd>lua require('fzf-lua').files({ cwd = '~/' })<CR>" ,default_settings)
map_key("n", "<c-P>", ":e",default_settings)




local terminal  = require('toggleterm.terminal').Terminal


-- Fish.

local fish = terminal:new({ cmd = "fish", hidden = true, direction = "float" })
function _fish_toggle()
  fish:toggle()
end
map_key(all_modes, "<F1>", "<Cmd>lua _fish_toggle()<CR>", default_settings)
map_key(n, "<Leader>t", "<Cmd>lua _fish_toggle()<CR>", default_settings)
-- map_key(n, "<F1>", "<Cmd>vsplit term://zsh<CR>", default_settings)

