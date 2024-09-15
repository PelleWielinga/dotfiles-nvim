{
  keymaps = [
    {
      action = ''<cmd>lua require("neotest").output.open({ enter = true })<cr>'';
      key = "<leader>to";
      options.desc = "Show test output";
    }
    {
      action = ''<cmd>lua require("neotest").output_panel.open({ enter = true })<cr>'';
      key = "<leader>tp";
      options.desc = "Show test output panel";
    }
    {
      action = ''<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>'';
      key = "<leader>tf";
      options.desc = "Test file";
    }
    {
      action = ''<cmd>Neotest summary<cr>'';
      key = "<leader>ts";
      options.desc = "Test summary";
    }
    {
      action = ''<cmd>lua require("neotest").run.run_last()<cr>'';
      key = "<leader>tl";
      options.desc = "Test last";
    }
    {
      action = ''<cmd>lua require("neotest").run.run()<cr>'';
      key = "<leader>tn";
      options.desc = "Test nearest";
    }
    {
      action = ''<cmd>lua require("neotest").watch.toggle(vim.fn.expand("%"))<cr>'';
      key = "<leader>tw";
      options.desc = "Watch file";
    }
    {
      action = ''<cmd>lua require("neotest").jump.next({ status = "failed" })<cr>'';
      key = "]n";
      options.desc = "Next failed test";
    }
    {
      action = ''<cmd>lua require("neotest").jump.prev({ status = "failed" })<cr>'';
      key = "[n";
      options.desc = "Previous failed test";
    }
    {
      action = ''<cmd>lua require("neotest").jump.next({ status = "failed" })<cr>'';
      key = "]=";
      options.desc = "Next failed test";
    }
    {
      action = ''<cmd>lua require("neotest").jump.prev({ status = "failed" })<cr>'';
      key = "[=";
      options.desc = "Previous failed test";
    }
    {
      action = ''<cmd>lua require("neotest").run.run({ strategy = "dap" })<cr>'';
      key = "<leader>td";
      options.desc = "Test file";
    }
  ];

  plugins = {
    neotest = {
      enable = true;
      adapters = {
        rust.enable = true;
        python.enable = true;
        go.enable = true;
        phpunit.enable = true;
      };
    };
  };
}

#         require("neotest-python")({
#           args = { "-vv" },
#           dap = { justMyCode = false },
#         }),
