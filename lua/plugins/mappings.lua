return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- hop-nvim mappings
          ["<Leader><Leader>w"] = {
            function() require("hop").hint_words { direction = require("hop.hint").HintDirection.AFTER_CURSOR } end,
            desc = "Hop forwards to start of word",
          },
          ["<Leader><Leader>b"] = {
            function() require("hop").hint_words { direction = require("hop.hint").HintDirection.BEFORE_CURSOR } end,
            desc = "Hop backwards to start of word",
          },
          ["<Leader><Leader><Leader>bdw"] = {
            function() require("hop").hint_words() end,
            desc = "Hop to start of word everywhere",
          },
          ["<Leader><Leader>e"] = {
            function()
              require("hop").hint_words {
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                hint_position = require("hop.hint").HintPosition.END,
              }
            end,
            desc = "Hop forwards to end of word",
          },
          ["<Leader><Leader>ge"] = {
            function()
              require("hop").hint_words {
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                hint_position = require("hop.hint").HintPosition.END,
              }
            end,
            desc = "Hop backwards to end of word",
          },
          ["<Leader><Leader><Leader>bde"] = {
            function() require("hop").hint_words { hint_position = require("hop.hint").HintPosition.END } end,
            desc = "Hop forwards to end of word",
          },
          ["<Leader><Leader>j"] = {
            function()
              require("hop").hint_lines_skip_whitespace { direction = require("hop.hint").HintDirection.AFTER_CURSOR }
            end,
            desc = "Hop down to line",
          },
          ["<Leader><Leader>k"] = {
            function()
              require("hop").hint_lines_skip_whitespace { direction = require("hop.hint").HintDirection.BEFORE_CURSOR }
            end,
            desc = "Hop up to line",
          },
          ["<Leader><Leader>/"] = {
            function() require("hop").hint_patterns() end,
            desc = "Hop to search pattern",
          },
          ["<Leader><Leader>?"] = {
            function() require("hop").hint_patterns { multi_windows = true } end,
            desc = "Hop to search pattern in all windows",
          },
          -- reimplement f/F
          ["f"] = {
            function()
              require("hop").hint_char1 {
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                current_line_only = true,
              }
            end,
            desc = "Next occurance of character in line",
          },
          ["F"] = {
            function()
              require("hop").hint_char1 {
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                current_line_only = true,
              }
            end,
            desc = "Previous occurance of character in line",
          },
          -- reimplement t/T
          ["t"] = {
            function()
              require("hop").hint_char1 {
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                current_line_only = true,
                hint_offset = -1,
              }
            end,
            desc = "Until next occurance of character in line",
          },
          ["T"] = {
            function()
              require("hop").hint_char1 {
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                current_line_only = true,
                hint_offset = -1,
              }
            end,
            desc = "Until previous occurance of character in line",
          },
        },
      },
    },
  },
  -- {
  --   "AstroNvim/astrolsp",
  --   ---@type AstroLSPOpts
  --   opts = {
  --     mappings = {
  --       n = {
  --         -- this mapping will only be set in buffers with an LSP attached
  --         K = {
  --           function()
  --             vim.lsp.buf.hover()
  --           end,
  --           desc = "Hover symbol details",
  --         },
  --         -- condition for only server with declaration capabilities
  --         gD = {
  --           function()
  --             vim.lsp.buf.declaration()
  --           end,
  --           desc = "Declaration of current symbol",
  --           cond = "textDocument/declaration",
  --         },
  --       },
  --     },
  --   },
  -- },
}
