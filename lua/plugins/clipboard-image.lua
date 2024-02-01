return {
  -- paste image from clipboard and link in markdown
  -- use a fork repo because the original author abandoned it.
  -- there seems to be a bug in windows if you try to paste image twice
  -- powershell will not get clipboard image, but insert text still generated
  {
    "dfendr/clipboard-image.nvim",
    config = function()
      local clipimg = require("clipboard-image")
      clipimg.setup({
        default = {
          img_dir = function() --{ "%:p:h", "img", "%:t:r" },
            local img_dir = { vim.fn.expand("%:p:h"), "img", vim.fn.expand("%:t") }
            return img_dir
          end,
          img_dir_txt = function()
            return { "img", vim.fn.expand("%:t") }
          end,
        },
      })
    end
  }
}
