return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,   -- show dotfiles
          ignored = false, -- hide git-ignored files
        },
      },
    },
  },
}
