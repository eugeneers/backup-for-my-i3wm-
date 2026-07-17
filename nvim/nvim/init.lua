require("config.options")
require("plugins.theme")
require("plugins.indent")
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cursorline = true

vim.opt.guicursor = "a:block"
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

--remove searh hilight when pres esc
vim.keymap.set('n','<Esc>','<cmd>nohlsearch<CR>')

--plugins
vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/catppuccin/nvim' },
  { src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
  { src = 'https://github.com/sainnhe/sonokai' },
  { src = 'https://github.com/morhetz/gruvbox' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
}
-- colorscheme --
vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme catppuccin")

--vim.g.sonokai_style = "atlantis"
--vim.g.sonokai_style = "andromeda"
--vim.g.sonokai_style = "maia"

--vim.g.sonokai_style = "espresso"
--vim.cmd("colorscheme sonokai")

--treesitter
require("nvim-treesitter.config").setup({
	ensure_installed = {"cpp", "c","latex"},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})


--lspconfig --
vim.lsp.enable({ 'clangd','texlab' })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
--vim.opt.autocomplete = true
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
	local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
	if client:supports_method('textDocument/completion') then
	    vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
	end
    end,
})

vim.opt.complete:append('o')
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.pumheight= 5
vim.o.pumborder = 'rounded'
	

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
