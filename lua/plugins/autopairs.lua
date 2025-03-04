return {
  'https://github.com/windwp/nvim-autopairs',
  -- If you want insert `(` after select function or method item
  config = function()
    local ap = require("nvim-autopairs")

    ap.setup({
      disable_filetype = { "TelescopePrompt", "vim" },
      fast_wrap = {
        map = '<A-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey = 'Comment'
      },
    })

    -- Add ability to add brackets after autocompleting a function like 'require' -> 'require()'
    -- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    -- local cmp = require('cmp')
    -- cmp.event:on(
    --   'confirm_done',
    --   cmp_autopairs.on_confirm_done()
    -- )
  end
}
