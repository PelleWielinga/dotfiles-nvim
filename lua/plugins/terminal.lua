return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    local toggleterm = require("toggleterm")
    local Terminal = require("toggleterm.terminal").Terminal

    toggleterm.setup({
      size = 30,
      start_in_insert = true,
    })

    local function simple_command(key, cmd, name)
      local term = Terminal:new({
        cmd = cmd,
        hidden = true,
        direction = "float",
      })

      local function toggle()
        term:toggle()
      end

      wk.add({ "<leader>e" .. key, toggle, desc = name })
    end

    local function register_generic_term(index)
      local term = Terminal:new()

      local name = "Toggle terminal " .. index

      local function toggle()
        if not term:is_open() then
          term:open()
        elseif not term:is_focused() then
          term:focus()
        else
          term:close()
        end
      end

      wk.add({
        { "<A-" .. index .. ">", toggle, desc = name, mode = { "n", "t", "i" } },
      })
    end

    wk.add({
      { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal", mode = { "i", "n", "t" } },
    })

    for i = 1, 5 do
      register_generic_term(i)
    end

    wk.add({ { "<leader>e", group = "Execute" } })

    simple_command("g", "lazygit", "Lazygit")
    simple_command("c", "cmatrix", "CMatrix")
  end,
}
