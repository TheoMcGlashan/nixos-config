local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
npairs.setup()
require("nvim-treesitter").setup({
	highlight = { enable = true },
	indent = { enable = true },
})
require("luasnip")
require("luasnip.loaders.from_lua").load({
	paths = "~/.config/nvim/lua/snippets/"
})
require("luasnip").config.set_config({
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
})
require("oil").setup()

local ok, cmp = pcall(require, "cmp")
if ok then
  local ls = require("luasnip")

  cmp.setup({
    completion = {
      autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
      completeopt = "menuone,noselect,popup"
    },

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

    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "cmp-omni"},
      { name = "omni" },
      { name = "buffer" },
    }),
  })

  local caps_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if caps_ok then
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  end
end
