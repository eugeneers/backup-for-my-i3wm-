require("config.options")
require("plugins.theme")
require("plugins.indent")
vim.opt.number = true
vim.opt.relativenumber = true
vim.keymap.set("n","<C-j>","<C-d>zz")
vim.keymap.set("n","<C-k>","<C-u>zz")
vim.opt.scrolloff = 15
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cursorline = true


--vim.opt.guicursor = "a:block"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"

-- Jump to front and back in Normal, Visual, and Operator-pending modes
vim.keymap.set({'n', 'v', 'o'}, '<C-a>', '^', { desc = 'Jump to start of line' })
vim.keymap.set({'n', 'v', 'o'}, '<C-f>', '$', { desc = 'Jump to end of line' })


-- Jump to front and back while actively typing (Insert Mode)
vim.keymap.set('i', '<C-a>', '<Esc>I', { desc = 'Jump to start of line' })
vim.keymap.set('i', '<C-f>', '<Esc>A', { desc = 'Jump to end of line' })

--remove searh higlight when pres esc
vim.keymap.set('n','<Esc>','<cmd>nohlsearch<CR>')

--plugins
vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/catppuccin/nvim' },
  { src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
  { src = 'https://github.com/sainnhe/sonokai' },
  { src = 'https://github.com/morhetz/gruvbox' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/catgoose/nvim-colorizer.lua' },
  { src = "https://github.com/Saghen/blink.lib" },
  { src = "https://github.com/Saghen/blink.cmp" },
 }
 -- Plugins
local cmp = require("blink.cmp")
cmp.build():pwait()

cmp.setup({
  keymap = {
    preset = "default",
  },
  sources = {
    default = { "lsp", "path", "buffer" },
  },
})
-- colorscheme --
vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme catppuccin")
vim.g.sonokai_style = "atlantis"
--vim.g.sonokai_style = "andromeda"
--vim.g.sonokai_style = "maia"
--vim.g.sonokai_style = "espresso"
--vim.cmd("colorscheme sonokai")


vim.opt.termguicolors = true
require("colorizer").setup({
	user_default_options = {
		RGB = true,
		RRGGBB = true,
		RRGGBBAA = true,
		names = false,
		css = true,
		css_fn = true,
		tailwind = true,
		mode = "background",
	},
})

--treesitter
require("nvim-treesitter.config").setup({
	ensure_installed = {"cpp","header", "c","latex"},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

--lspconfig --
vim.lsp.enable({ "clangd", 'texlab'})
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
	local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
	local opts = { buffer = ev.buf }
--completion
	if client:supports_method('textDocument/completion') then
		vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
	end
end,
})

--ui
--vim.opt.autocomplete = true
vim.opt.complete:append('o')
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.pumheight= 5
vim.o.pumborder = 'rounded'

vim.api.nvim_set_hl(0, "Pmenu", {
	bg = "NONE",
})

vim.api.nvim_set_hl(0, "PmenuSel", {
	bg = "#504945", -- selected item
})

vim.api.nvim_set_hl(0, "PmenuBorder", {
	bg = "NONE",
})

vim.api.nvim_set_hl(0, "NormalFloat", {
	bg = "NONE",
})

vim.api.nvim_set_hl(0, "FloatBorder", {
	bg = "NONE",
})

--indent-blankline

vim.schedule(function()
    require("ibl").setup({
	indent = {
	    char ="▏",
	},
	scope = {
	    enabled = true,
	},
    })
end)

