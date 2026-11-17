return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- nvim-treesitter (0.12+ rewrite) cannot be lazy-loaded.
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- Treesitter highlighting is provided by Neovim; enable it per filetype.
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      -- Install a starter set of parsers (compiled locally; needs cc + tree-sitter-cli).
      require("nvim-treesitter").install({
        "bash",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "vim",
        "vimdoc",
        "yaml",
      })
    end,
  },
}
