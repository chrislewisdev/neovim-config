require('packer-bootstrap');

-- Basic config options
vim.opt.number = true;
vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true;

-- Use system clipboard?
vim.api.nvim_set_option("clipboard","unnamed")

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
--require('telescope').setup{
--    pickers = {
--        find_files = {
--            -- show hidden/ignored files
--            find_command = { "rg", "--files", "--hidden", "--no-ignore-vcs", "--glob", "!**/.git/*" },
--        }
--    }
--};
local builtin = require('telescope.builtin');
vim.keymap.set('n', '<C-p>', builtin.find_files, {});
vim.keymap.set('n', '<C-f>', builtin.live_grep, {});
vim.keymap.set('n', '<C-s>', builtin.lsp_document_symbols, {});
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, {});

-- Treesitter
require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
      "c", "lua", "vim", "vimdoc", "query", "c_sharp", "cpp", "css", "go", "html", "javascript", "json", "make", "python", "rust", "typescript"
  },
  highlight = { enable = true },
};

-- Language servers
require('mason').setup();
require('mason-lspconfig').setup();
require('lspconfig').lua_ls.setup({});
--require('lspconfig').clangd.setup({});
require('lspconfig').csharp_ls.setup({});
require('lspconfig').rust_analyzer.setup({});

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function (ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc';

        local opts = { buffer = ev.buf };
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts);
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts);
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts);
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts);
    end
});

