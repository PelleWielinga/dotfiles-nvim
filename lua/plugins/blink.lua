return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  event = "VeryLazy",
  version = "1.*",
  opts = {
    keymap = { preset = "default" },
    appearance = {
      nerd_font_variant = "mono",
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },

  opts_extend = { "sources.default" },
}
