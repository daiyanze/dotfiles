return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.component_separators = ""
    opts.options.section_separators = ""
    opts.sections.lualine_z = {}

    return opts
  end,
}
