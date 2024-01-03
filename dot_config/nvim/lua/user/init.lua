return {
  colorscheme = "gruvbox-material",
  options = {
    g = {
      -- Theme gruvbox-material
      gruvbox_material_palette = "mix",
      gruvbox_material_enable_italic = 1,
      -- gruvbox_material_enable_bold = 1,

      -- Leetcode
      leetcode_solution_filetype = "javascript",
      leetcode_browser = "chrome",
    }
  },
  lsp = {
    -- This is to resolve the following warning:
    -- warning: multiple different client offset_encodings detected for buffer, this is not supported yet
    skip_setup = { "clangd" },
    ["server-settings"] = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-16",
        },
      },
    },
  },
  mappings = {
    n = {
      -- Debugger
      ["<leader>ds"] = { "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Breakpoint condition: '))<CR>", desc =
      "Set Breakpoint Condition" },
      ["<leader>dl"] = { "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", desc =
      "Log point message" },
      -- ToggleTerm
      ["<leader>th"] = { "<cmd>ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
      ["<leader>tv"] = { "<cmd>ToggleTerm direction=vertical<cr>", desc = "ToggleTerm vertical split" },
      -- Move current line / block with Alt-j/k a la vscode.
      ["<M-j>"] = ":m .+1<CR>==",
      ["<M-k>"] = ":m .-2<CR>==",
      -- Add Buffer navigation keys
      L = {
        function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Next buffer"
      },
      H = {
        function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        desc = "Previous buffer"
      },
    },
    i = {
      ["<C-h>"] = { "<Left>", desc = "move left" },
      ["<C-l>"] = { "<Right>", desc = "move right" },
      ["<C-j>"] = { "<Down>", desc = "move down" },
      ["<C-k>"] = { "<Up>", desc = "move up" },
    },
    v = {
      -- Move selected line / block of text in visual mode
      ["K"] = ":move '<-2<CR>gv-gv",
      ["J"] = ":move '>+1<CR>gv-gv",
      -- Move current line / block with Alt-j/k ala vscode.
      ["<A-j>"] = ":m '>+1<CR>gv-gv",
      ["<A-k>"] = ":m '<-2<CR>gv-gv",
    },
  },
  plugins = {
    -- Override existing plugins
    {
      "nvim-neo-tree/neo-tree.nvim",
      config = function(_, opts)
        opts.window = {
          width = 35
        }
        require("neo-tree").setup(opts)
      end
    },
    {
      "akinsho/toggleterm.nvim",
      config = function(_, opts)
        opts.size = function(term)
          if term.direction == "horizontal" then
            return 10
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end

        require("toggleterm").setup(opts)
      end
    },
    {
      "folke/which-key.nvim",
      opts = {
        icons = {
          -- The separator in core plugin config is unreadable. Changed to space
          group = vim.g.icons_enabled and "" or "+",
          separator = " "
        },
        disable = { filetypes = { "TelescopePrompt" } },
      },
    },

    -- Extra custom plugins
    { "github/copilot.vim" },
    { "sainnhe/gruvbox-material" },
    {
      "martinda/Jenkinsfile-vim-syntax",
      event = "VeryLazy",
    },
    {
      "gpanders/editorconfig.nvim",
      event = "VeryLazy",
    },
    {
      "mg979/vim-visual-multi",
      event = "VeryLazy",
    },
    {
      "sindrets/diffview.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      event = "VeryLazy",
    },
    {
      "nacro90/numb.nvim",
      event = "VeryLazy",
      config = function()
        require("numb").setup()
      end,
    },
    {
      "petertriho/nvim-scrollbar",
      event = "VeryLazy",
      config = function()
        require("scrollbar").setup({
          handle = {
            color = "#46413e",
          },
          marks = {
            Search = { color = "#f28534" },
            Error = { color = "#db4740" },
            Warn = { color = "#e9b143" },
            Info = { color = "#80aa9e" },
            Hint = { color = "#b0b846" },
            Misc = { color = "#d3869b" },
          }
        })
      end
    },
    {
      "ggandor/lightspeed.nvim",
      event = "VeryLazy",
      config = function()
        require("lightspeed").setup {}
      end
    },
    {
      "folke/todo-comments.nvim",
      event = "VeryLazy",
      config = function()
        require("todo-comments").setup({
          -- The colors are copied from the gruvbox-material "mix" theme
          colors = {
            error = { "DiagnosticError", "ErrorMsg", "#db4740" },
            warning = { "DiagnosticWarning", "WarningMsg", "#e9b143" },
            info = { "DiagnosticInfo", "#80aa9e" },
            hint = { "DiagnosticHint", "#b0b846" },
            default = { "Identifier", "#d3869b" },
          }
        })
      end
    },
    {
      "folke/trouble.nvim",
      event = "VeryLazy",
      config = function()
        require("trouble").setup()
      end
    },
    {
      "ianding1/leetcode.vim",
      event = "VeryLazy",
    },
    {
      "mattn/emmet-vim",
      event = "VeryLazy",
    },
    -- {
    --   "mfussenegger/nvim-dap",
    --   opt = true,
    --   config = function()
    --     vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
    --     vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
    --     vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
    --     vim.fn.sign_define("DapLogPoint", { text = "קּ", texthl = "", linehl = "", numhl = "" })
    --     vim.fn.sign_define("DapStopped", { text = "ﱢ", texthl = "", linehl = "", numhl = "" })
    --   end
    -- },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "mfussenegger/nvim-dap" },
      config = function(_, opts)
        opts.layouts = {
          layouts = {
            {
              elements = {
                { id = "watches",     size = 0.20 },
                { id = "stacks",      size = 0.20 },
                { id = "breakpoints", size = 0.20 },
                { id = "scopes",      size = 0.40 },
              },
              size = 64,
              position = "left",
            },
            {
              elements = {
                "repl",
                "console",
              },
              size = 0.20,
              position = "bottom",
            },
          },
        }

        require("dapui").setup(opts)
      end
    },
    {
      "microsoft/vscode-js-debug",
      run = "npm install --legacy-peer-deps && npm run compile",
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      dependencies = { "microsoft/vscode-js-debug" },
      config = function()
        require("dap-vscode-js").setup({
          node_path = "node",                                                                          -- Path of node executable. Defaults to $NODE_PATH, and then "node"
          -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
          adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
        })

        for _, language in ipairs({ "typescript", "javascript" }) do
          require("dap").configurations[language] = {
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch file",
              program = "${file}",
              cwd = "${workspaceFolder}",
            },
            {
              type = "pwa-node",
              request = "attach",
              name = "Attach",
              processId = require("dap.utils").pick_process,
              cwd = "${workspaceFolder}",
            }
          }
        end
      end
    },
    {
      "theHamsta/nvim-dap-virtual-text",
    },
  },
}
