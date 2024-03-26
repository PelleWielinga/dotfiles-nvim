return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    local toggleterm = require("toggleterm")
    local Terminal = require("toggleterm.terminal").Terminal

    toggleterm.setup({
      size = 30,
      on_open = function()
        vim.cmd("startinsert!")
      end,
    })

    local function simple_command(key, cmd, name)
      local term = Terminal:new({
        cmd = cmd,
        hidden = true,
        direction = "tab",
      })

      local function toggle()
        term:toggle()
      end

      wk.register({ [key] = { toggle, name } }, { prefix = "<leader>e" })
    end

    local function register_generic_term(index)
      local term = Terminal:new()

      local name = "Toggle terminal " .. index

      local function toggle()
        if not term:is_open() then
          term:open()
        elseif not term:is_focused() then
          term:focus()
          vim.cmd("startinsert!")
        else
          term:close()
        end
      end

      wk.register({ ["<A-" .. index .. ">"] = { toggle, name } }, { mode = { "n", "t", "i" } })
    end

    wk.register({ ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" } }, { mode = { "n", "i", "t" } })

    for i = 1, 5 do
      register_generic_term(i)
    end

    wk.register({ ["<leader>e"] = { name = "Execute" } })

    simple_command("g", "lazygit", "Lazygit")
    simple_command("c", "cmatrix", "CMatrix")
  end,
}
