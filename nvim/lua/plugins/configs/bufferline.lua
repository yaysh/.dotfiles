vim.opt.termguicolors = true

require("bufferline").setup{
  offsets = {{
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "left"
  }},
  diagnostics = "nvim_lsp",
  color_icons = true
}
