local M = {}

M._handlers = {}

M.setup = function (handlers)
  M._handlers = handlers
end

M.run = function()
  local current_buffer = vim.api.nvim_get_current_buf()
  local filetype = vim.filetype.match({ buf = current_buffer })

  local handler = M._handlers[filetype]

  if not handler then
    print(string.format('No handler defined for filetype \'%s\'', filetype))
    return
  end

  handler(current_buffer)
end

return M
