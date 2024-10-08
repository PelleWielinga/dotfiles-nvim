{ pkgs, ... }:
{
  plugins = {
    cmp = {
      enable = true;

      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
        ];

        mapping = {
          "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<Right>" = # lua
            ''
              cmp.mapping(function(fallback)
                if luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif cmp.visible() then
                  cmp.confirm({select = true})
                else
                  fallback()
                end
              end, {'i', 's'})
            '';

          "<Left>" = # lua
            ''
              cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end, {'i', 's'})
            '';

          "<C-e>" = "cmp.mapping.abort()";
        };
      };
    };

    luasnip = {
      enable = true;

      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };

      fromVscode = [
        {
          lazyLoad = true;
          paths = "${pkgs.vimPlugins.friendly-snippets}";
        }
      ];
    };
  };
}
