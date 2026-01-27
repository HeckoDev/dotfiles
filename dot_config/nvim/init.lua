-- ============================================================================
-- Configuration Neovim avec thème Kanagawa
-- ============================================================================

-- Paramètres de base
vim.opt.number = true              -- Numéros de ligne
vim.opt.relativenumber = true      -- Numéros relatifs
vim.opt.mouse = 'a'                -- Support souris
vim.opt.clipboard = 'unnamedplus'  -- Presse-papier système
vim.opt.termguicolors = true       -- Vraies couleurs

-- Indentation
vim.opt.expandtab = true           -- Espaces au lieu de tabs
vim.opt.shiftwidth = 4             -- Largeur indentation
vim.opt.tabstop = 4                -- Largeur tab
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Interface
vim.opt.cursorline = true          -- Ligne courante surlignée
vim.opt.showmatch = true           -- Parenthèses correspondantes
vim.opt.showcmd = true
vim.opt.laststatus = 2             -- Barre de statut
vim.opt.scrolloff = 8              -- Lignes visibles autour du curseur
vim.opt.sidescrolloff = 8
vim.opt.wrap = true
vim.opt.linebreak = true

-- Recherche
vim.opt.incsearch = true           -- Recherche incrémentale
vim.opt.hlsearch = true            -- Surligner résultats
vim.opt.ignorecase = true          -- Ignorer casse
vim.opt.smartcase = true           -- Casse intelligente

-- Performance
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- Fichiers
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.hidden = true

-- Colonnes guides
vim.opt.colorcolumn = "80,120"

-- Caractères invisibles
vim.opt.list = true
vim.opt.listchars = {
  tab = '→ ',
  trail = '·',
  nbsp = '␣',
  extends = '⟩',
  precedes = '⟨'
}

-- Leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- ============================================================================
-- Gestionnaire de plugins - lazy.nvim
-- ============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configuration des plugins
require("lazy").setup({
  -- Thème Kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        theme = "wave",  -- wave, dragon, lotus
        background = {
          dark = "wave",
          light = "lotus"
        },
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },

  -- Treesitter pour meilleure coloration
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "python", "go", "javascript", "typescript", "lua", "rust", "bash", "json", "yaml", "html", "css" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Auto-paires
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },

  -- Commentaires intelligents
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  -- Barre de statut
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'kanagawa',
          section_separators = '',
          component_separators = '|'
        }
      })
    end,
  },

  -- Explorateur de fichiers
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        view = {
          width = 30,
        },
      })
    end,
  },

  -- Telescope (recherche floue)
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({})
    end,
  },

  -- Git signs
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '│' },
          change = { text = '│' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      })
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup()
    end,
  },
})

-- ============================================================================
-- Raccourcis clavier
-- ============================================================================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Fichiers
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>q', ':q<CR>', opts)
keymap('n', '<leader>x', ':x<CR>', opts)
keymap('n', '<leader>e', ':e ~/.config/nvim/init.lua<CR>', opts)
keymap('n', '<leader>r', ':source ~/.config/nvim/init.lua<CR>:echo "Config rechargée!"<CR>', opts)

-- Navigation
keymap('n', '<leader>n', ':bnext<CR>', opts)
keymap('n', '<leader>p', ':bprevious<CR>', opts)
keymap('n', '<leader>d', ':bdelete<CR>', opts)
keymap('n', 'H', '^', opts)
keymap('n', 'L', '$', opts)
keymap('v', 'H', '^', opts)
keymap('v', 'L', '$', opts)

-- Splits
keymap('n', '<leader>h', ':split<CR>', opts)
keymap('n', '<leader>v', ':vsplit<CR>', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Édition
keymap('n', '<leader>k', 'yyp', opts)
keymap('n', '<leader>K', 'yyP', opts)
keymap('n', '<leader>a', 'ggVG', opts)
keymap('n', '<leader>ss', ':%s/\\s\\+$//e<CR>', opts)
keymap('n', '<A-j>', ':m .+1<CR>==', opts)
keymap('n', '<A-k>', ':m .-2<CR>==', opts)
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Indentation en mode visuel
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Recherche
keymap('n', '<leader><space>', ':nohlsearch<CR>', opts)
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- NvimTree
keymap('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
keymap('n', '<leader>f', ':NvimTreeFocus<CR>', opts)

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
keymap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)

-- Git
keymap('n', '<leader>gs', ':!git status<CR>', opts)
keymap('n', '<leader>gd', ':!git diff %<CR>', opts)
keymap('n', '<leader>gl', ':!git log --oneline %<CR>', opts)

-- Exécution rapide selon le langage
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    keymap('n', '<F5>', ':w<CR>:!python3 %<CR>', { buffer = true })
    keymap('n', '<F7>', ':w<CR>:!pytest %<CR>', { buffer = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    keymap('n', '<F5>', ':w<CR>:!go run %<CR>', { buffer = true })
    keymap('n', '<F6>', ':w<CR>:!go build<CR>', { buffer = true })
    keymap('n', '<F7>', ':w<CR>:!go test ./...<CR>', { buffer = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"javascript", "typescript"},
  callback = function()
    keymap('n', '<F5>', ':w<CR>:!node %<CR>', { buffer = true })
    keymap('n', '<F7>', ':w<CR>:!npm test<CR>', { buffer = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    keymap('n', '<F5>', ':w<CR>:!cargo run<CR>', { buffer = true })
    keymap('n', '<F6>', ':w<CR>:!cargo build<CR>', { buffer = true })
    keymap('n', '<F7>', ':w<CR>:!cargo test<CR>', { buffer = true })
  end,
})

-- ============================================================================
-- Configuration spécifique par langage
-- ============================================================================

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.colorcolumn = "80"
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"javascript", "typescript", "json", "html", "css", "yaml"},
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

-- ============================================================================
-- Auto-commandes diverses
-- ============================================================================

-- Retourner à la dernière position
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Highlight lors du yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- ============================================================================
-- Message de bienvenue
-- ============================================================================

print("🚀 Neovim avec Kanagawa chargé!")
print("Leader: ',' | :Lazy pour gérer les plugins | :checkhealth pour diagnostics")
