return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  -- paste image from clipboard and link in markdown
  {
    "ekickx/clipboard-image.nvim",
    config = function()
      require 'clipboard-image'.setup {
        default = {
          img_dir = { "%:p:h", "img", "%:t:r" },
          img_name = function() return os.date("%Y%m%d%H%M%S") end,
        },
      }
    end
  }
}
