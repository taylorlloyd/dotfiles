-- Set sane editing defaults
vim.o.termguicolors = true
vim.o.syntax = 'on'
vim.o.errorbells = false
vim.o.smartcase = true
vim.bo.swapfile = false
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.completeopt = 'menuone,noinsert,noselect'

vim.bo.autoindent = true
vim.bo.smartindent = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.wo.number = true
vim.wo.wrap = false

vim.g.mapleader = ','

-- Setup plugins with Packer
local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function()
  local use = use
  use {
    'nvim-treesitter/nvim-treesitter',
     run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
          end
  }
  use 'sheerun/vim-polyglot'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'folke/tokyonight.nvim'
  use({
  "jackMort/ChatGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
})
  use 'ErichDonGubler/lsp_lines.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  end
)

vim.cmd[[colorscheme tokyonight]]

local configs = require'nvim-treesitter.configs'

configs.setup {
  ensure_installed = { "c", "lua", "vim", "cpp", "cuda", "bash", "dot", "gitcommit", "java", "llvm", "mlir", "python", "rust", "sql", "yaml" },
  highlight = {
    enable = true,
  }
}

local lspconfig = require'lspconfig'
local completion = require'completion'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local function custom_on_attach(client)
  print('Attaching to ' .. client.name)
  completion.on_attach(client)
end
local default_config = {
  on_attach = custom_on_attach,
}

-- Setup LSP configurations

lspconfig.clangd.setup {
  filetypes = { "c", "cpp", "cc", "cuda", "cl", "h", "hpp" },
  cmd = { "/Users/tjlloyd/homebrew/opt/llvm/bin/clangd" },
  an_attach = custom_on_attach,
  capabilities = capabilities
}

-- Setup ChatGPT integrations
--
local chatgpt = require("chatgpt").setup()

local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

-- Prefer lsp_lines to the existing text diagnostics
require('lsp_lines').setup()
vim.diagnostic.config({
    virtual_text = false,
})

-- Setup Autocomplete
local cmp = require('cmp')
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, {"i", "s"}),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })
  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })


  

key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
key_mapper('n', 'F', ':lua vim.lsp.buf.code_action()<CR>')
key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')

key_mapper('n', 'ff', ":lua require'telescope.builtin'.find_files()<CR>")
key_mapper('n', 'fg', ":lua require'telescope.builtin'.git_files()<CR>")
key_mapper('n', 'fs', ":lua require'telescope.builtin'.live_grep()<CR>")
key_mapper('n', 'fd', ":lua require'telescope.builtin'.diagnostics()<CR>")

vim.g.colors_name = 'molokai'
