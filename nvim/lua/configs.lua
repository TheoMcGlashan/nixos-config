-- Basic setup for some plugins
require("luasnip")
require("nvim-autopairs").setup()
require("mini.icons").setup()
require("oil").setup()
require("todo-comments").setup()

-- Define location of snippets folder
require("luasnip.loaders.from_lua").load({
	paths = "~/.config/nvim/lua/snippets/"
})

-- Enable autosnippets, keys for other plugins/features
require("luasnip").config.set_config({
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
})

-- Set up treesitter for other plugins/features to use
require("nvim-treesitter").setup({
	highlight = { enable = true },
	indent = { enable = true },
})

-- luasnip setup, with cmp completions as dependency
local ok, cmp = pcall(require, "cmp")
if ok then
  local ls = require("luasnip")

	-- Set up and slightly configure cmp.
  cmp.setup({
    completion = {
      autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
      completeopt = "menuone,noselect,popup"
    },

		-- Set keybinds for autocomplete
    mapping = cmp.mapping.preset.insert({
      ["<Up>"] = cmp.mapping.select_prev_item(),
      ["<Down>"] = cmp.mapping.select_next_item(),

      ["<Tab>"] = cmp.mapping(function(fallback)
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        elseif cmp.visible() then
          cmp.confirm({ select = true })
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<Esc>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.abort()
        end
        fallback()
      end, { "i", "s" }),
    }),

		-- Define autocomplete sources
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "cmp-omni"},
      { name = "omni" },
      { name = "buffer" },
    }),
  })

	-- Connect cmp to lsp.
  local caps_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if caps_ok then
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  end
end
