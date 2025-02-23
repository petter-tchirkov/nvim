return {
    "atiladefreitas/dooing",
    config = function()
        require("dooing").setup({
            -- your custom config here (optional)
        })
    end,
    vim.keymap.set('n', '<leader>do', ':Dooing<CR>', {silent = true})
}
