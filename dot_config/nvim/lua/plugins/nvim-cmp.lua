return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local luasnip = require("luasnip")
    local cmp = require("cmp")

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    })

    -- CopilotChat-specific cmp config
    cmp.setup.filetype("copilot-chat", {
      completion = {
        autocomplete = false,
        completeopt = table.concat(vim.opt.completeopt:get(), ","),
      },
      mapping = {
        -- Keep it simple: <Tab> confirms a completion, <CR> sends the chat
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<S-Tab>"] = cmp.mapping.close(),
      },
      sources = cmp.config.sources({
        { name = "copilot" }, -- from copilot
        { name = "copilot-chat" }, -- from copilot chat
        { name = "buffer" }, -- words from the current buffer
        { name = "path" }, -- filesystem paths
        { name = "emoji" }, -- since you already depend on cmp-emoji
      }),
    })
  end,
}
