local M = {
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    expand = "<CR>",
    open = "o",
    remove = "d",
    edit = "`",
    repl = "r",
    toggle = "t",
  },
  expand_lines = 1,
  layouts = { {
    elements = { {
      id = "scopes",
      size = 0.25
    }, {
      id = "breakpoints",
      size = 0.25
    }, {
      id = "stacks",
      size = 0.25
    }, {
      id = "watches",
      size = 0.25
    } },
    position = "left",
    size = 40
  }, {
    elements = { {
      id = "repl",
      size = 0.5
    }, {
      id = "console",
      size = 0.5
    } },
    position = "bottom",
    size = 10
  } },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil,  -- These can be integers or a float between 0 and 1.
    max_width = nil,   -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
}

return M;
