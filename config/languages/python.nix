{
  plugins = {
    lsp.servers = {
      pylsp = {
        enable = false;
        settings.plugins = {
          rope.enabled = true;
          rope_autoimport.enabled = true;
          pylsp_mypy.enabled = true;
          ruff.enabled = true;
          isort.enabled = true;
        };
      };

      basedpyright.enable = true;
      ruff.enable = true;
    };

    neotest.adapters.python = {
      enable = true;
      settings = {
        args = [
          "-vv"
        ];
      };
    };
  };
}
