local M = {}

M._handlers = {}

M.setup = function (handlers)
  M._handlers = handlers
end

M.run = function()
  local code_bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.filetype.match({ buf = code_bufnr })

  local handler = M._handlers[filetype]

  if not handler then
    print(string.format('No handler defined for filetype \'%s\'', filetype))
    return
  end
  --
  -- if not output_bufnr or not vim.api.nvim_buf_is_valid(output_bufnr) then
  --   output_bufnr = vim.api.nvim_create_buf(true, true)
  --   vim.api.nvim_buf_set_name(output_bufnr, 'OUTPUT - ' .. vim.api.nvim_buf_get_name(code_bufnr))
  --   vim.api.nvim_buf_set_option(output_bufnr, 'modifiable', false)
  -- end
  --
  -- if not output_winnr or not vim.api.nvim_win_is_valid(output_winnr) then
  --   vim.cmd('vsplit')
  --   output_winnr = vim.api.nvim_get_current_win()
  --
  --   local win_opts = {
  --     number = false,
  --     relativenumber = false,
  --     wrap = false,
  --     spell = false,
  --     foldenable = false,
  --     signcolumn = "no",
  --     colorcolumn = "",
  --     cursorline = true,
  --   }
  --   for key, value in pairs(win_opts) do
  --     vim.api.nvim_win_set_option(output_winnr, key, value)
  --   end
  --
  --   vim.api.nvim_win_set_buf(output_winnr, output_bufnr)
  -- end
  --
  -- vim.api.nvim_buf_set_option(output_bufnr, 'modifiable', true)
  -- vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, {})
  -- vim.api.nvim_buf_set_option(output_bufnr, 'modifiable', false)
  --
  -- local add_line = function(_, data)
  --   local row = vim.api.nvim_buf_line_count(output_bufnr) - 1
  --   local col = vim.fn.len(vim.api.nvim_buf_get_lines(output_bufnr, -2, -1, false)[1])
  --   vim.api.nvim_buf_set_option(output_bufnr, 'modifiable', true)
  --   vim.api.nvim_buf_set_text(output_bufnr, row, col, row, col, data)
  --   vim.api.nvim_buf_set_option(output_bufnr, 'modifiable', false)
  -- end
  --
  handler()
end

return M
