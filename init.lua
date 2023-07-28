require('packer-bootstrap');

-- Basic config options
vim.opt.number = true;
vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true;

-- Tab keybindings
vim.keymap.set('n', '<A-Right>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true});
vim.keymap.set('n', '<A-Left>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true});

-- Editor keybindings
vim.keymap.set('n', '<A-Up>', ':move -2<CR>', { noremap = true, silent = true});
vim.keymap.set('n', '<A-Down>', ':move +1<CR>', { noremap = true, silent = true});

-- Colour theme setup
vim.cmd[[colorscheme tokyonight]];

-- nvim-tree setup
vim.g.loaded_netrw = 1;
vim.g.loaded_netrwPlugin = 1;
vim.opt.termguicolors = true;
require("nvim-tree").setup();

-- telescope setup
local builtin = require('telescope.builtin');
vim.keymap.set('n', '<C-p>', builtin.find_files, {});

