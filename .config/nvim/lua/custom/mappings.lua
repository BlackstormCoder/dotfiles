local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}




M.transparency =  {
  n = {
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },
  }
}


M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<C-_>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  }
}

M.nvimtree = {
  plugin = true,

  i = {
    -- toggle
    ["<F2>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

  },
  n = {
    -- toggle
    ["<F2>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },

  v = {
    -- toggle
    ["<F2>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

  },
}



M.telescope = {
  plugin = true,

  n = {
    ["<F4>"] = {"<cmd>Telescope live_grep<CR>", "Grep for a string in the current directory"},
    ["<C-t>"] = {"<cmd>Telescope oldfiles<CR>", "Search for old files"},
    ["<C-f>"] = {"<cmd>Telescope current_buffer_fuzzy_find previewer=false<CR>", "Find in buffer"},
    ["<F3>"] = {"<cmd>Telescope find_files<CR>", "Find files with Telescope"},
  },
}

M.general = {
  n = {
    ["<C-h>"] = {"<cmd>wincmd h<CR>", "Move window left"},
    ["<C-j>"] = {"<cmd>wincmd j<CR>", "Move window down"},
    ["<C-k>"] = {"<cmd>wincmd k<CR>", "Move window up"},
    ["<C-l>"] = {"<cmd>wincmd l<CR>", "Move window right"},
    ["d"] = {"\"_d", "Delete without yanking"},
    ["c"] = {"\"_c", "Delete and enter in insert mode without yanking"},
    ["<C-s>w"] = {"<cmd>wqall!<CR>", "Save all and exit"},
--    ["<C-=>"] = {"<cmd>vertical resize +5<CR>", "Resize window wider"},
--    ["<C-->"] = {"<cmd>vertical resize -5<CR>", "Resize window narrower"},
--    ["<C-+>"] = {"<cmd>horizontal resize +5<CR>", "Resize window taller"},
--    ["<C-_>"] = {"<cmd>horizontal resize -5<CR>", "Resize window shorter"},

    ["<Esc>"] = {"<cmd>noh<CR>", "Disable search highlight"},
    ["<C-Z>"] = {"<cmd>undo<CR>", "Undo"},
    ["<C-Y>"] = {"<cmd>redo<CR>", "Redo"},
--    ["<C-h>"] = {"<C-w>h", "Better window navigation"},
--    ["<C-j>"] = {"<C-w>j", "Better window navigation"},
--    ["<C-k>"] = {"<C-w>k", "Better window navigation"},
--    ["<C-l>"] = {"<C-w>l", "Better window navigation"},
    ["<C-Up>"] = {":resize -2<CR>", "Resize with arrows"},
    ["<C-Down>"] = {":resize +2<CR>", "Resize with arrows"},
    ["<C-Left>"] = {":vertical resize -2<CR>", "Resize with arrows"},
    ["<C-Right>"] = {":vertical resize +2<CR>", "Resize with arrows"},
    ["<S-l>"] = {":bnext<CR>", "Next buffer"},
    ["<S-h>"] = {":bprevious<CR>", "Previous buffer"},
    ["<C-w>q"] = {":bdelete<CR>", "Close buffer"},
    ["<A-j>"] = {"<Esc>:m .+1<CR>==", "Move text down"},
    ["<A-k>"] = {"<Esc>:m .-2<CR>==", "Move text up"},
    ["<"] = {"<gv", "Stay in indent mode"},
    [">"] = {">gv", "Stay in indent mode"},
    ["J"] = {"mzJ`z", "Remain cursor at the same position after deleting the new line"},
    ["<C-d>"] = {"<C-d>zz", "Remain cursor at the same position after deleting the new line"},
    ["<C-u>"] = {"<C-u>zz", "Remain cursor at the same position after deleting the new line"},
    ["n"] = {"nzzzv", "Remain cursor at the same position after deleting the new line"},
    ["N"] = {"Nzzzv", "Remain cursor at the same position after deleting the new line"},
    ["<leader>s"] = {":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Search and replace"},
    ["<leader>x"] = {"<cmd>!chmod +x %<CR>", "Make file executable"},
    ["<C-c>"] = {"<Esc>", "Exit insert mode"},
  },
  v = {
    ["<"] = {"<gv", "Stay in indent mode (Visual)"},
    [">"] = {">gv", "Stay in indent mode (Visual)"},
    ["<A-j>"] = {":move '>+1<CR>gv-gv", "Move text down (Visual Block)"},
    ["<A-k>"] = {":move '<-2<CR>gv-gv", "Move text up (Visual Block)"},
    ["p"] = {"\"_dP", "Paste without replacing"},
    ["<C-c>"] = {"<Esc>", "Exit insert mode"},
    ["<C-s>w"] = {"<cmd>wqall!<CR>", "Save all and exit"},
  },
  t = {
    ["<C-h>"] = {"<C-\\><C-N><C-w>h", "Move terminal left"},
    ["<C-j>"] = {"<C-\\><C-N><C-w>j", "Move terminal down"},
    ["<C-k>"] = {"<C-\\><C-N><C-w>k", "Move terminal up"},
    ["<C-l>"] = {"<C-\\><C-N><C-w>l", "Move terminal right"},
  },
  i = {
    ["<C-c>"] = {"<Esc>", "Exit insert mode"},
    ["<C-s>w"] = {"<cmd>wqall!<CR>", "Save all and exit"},
    -- ... other mappings ...
  },
}

return M
