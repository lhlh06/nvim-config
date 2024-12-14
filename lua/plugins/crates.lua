return {
  'saecki/crates.nvim',
  tag = 'stable',
  config = function()
    require('crates').setup {
      completion = {
        cmp = {
          enabled = true
        },

        -- Disabel crates name completion
        -- crates = {
        --   enabled = true,
        --   max_results = 8,
        --   min_chars = 3,
        -- }

      },

    }
  end,
}
