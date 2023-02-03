local Job = require('plenary.job')
local baleia = require('baleia').setup {}

local M = {}

M._buffer = nil
M._window = nil

M.create_buffer = function(name)
  if M._buffer and vim.api.nvim_buf_is_valid(M._buffer) then
    vim.api.nvim_buf_set_option(M._buffer, 'modifiable', true)
    vim.api.nvim_buf_set_lines(M._buffer, 0, -1, false, {})
    vim.api.nvim_buf_set_option(M._buffer, 'modifiable', false)
    return M._buffer
  end

  local buffer = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_name(buffer, name)
  vim.api.nvim_create_autocmd('BufHidden', {
    buffer = buffer,
    callback = function()
      vim.schedule(function()
        vim.api.nvim_buf_delete(buffer, {})
        print('Terminated running process')
      end)
    end
  })
  vim.api.nvim_buf_set_option(buffer, 'modifiable', false)

  M._buffer = buffer
  return buffer
end

M.create_window = function()
  if M._window and vim.api.nvim_win_is_valid(M._window) and vim.api.nvim_win_get_buf(M._window) == M._buffer then
    return M._window
  end
  vim.cmd [[ vsplit ]]
  local window = vim.api.nvim_get_current_win()

  local window_opts = {
    number = false,
    relativenumber = false,
    wrap = true,
    spell = false,
    foldenable = false,
    signcolumn = "no",
    colorcolumn = "",
    cursorline = true,
  }

  for key, value in pairs(window_opts) do
    vim.api.nvim_win_set_option(window, key, value)
  end

  M._window = window
  return window
end

M.create_add_line = function(buffer)
  return function(_, data)
    vim.api.nvim_buf_set_option(buffer, 'modifiable', true)
    local row = vim.api.nvim_buf_line_count(buffer) - 1
    local col = vim.fn.len(vim.api.nvim_buf_get_lines(buffer, -2, -1, false)[1])
    baleia.buf_set_text(buffer, row, col, row, col, vim.tbl_map(
      function(d)
        return vim.fn.trim(d, ('\x0D'))
      end,
      data
    ))
    vim.api.nvim_buf_set_option(buffer, 'modifiable', false)
  end
end

M.run_command = function(command, callback)
  local run_output = ''

  local on_output = function(_, data)
    -- run_output[#run_output + 1] = data
    for _, value in pairs(data) do
      run_output = run_output .. value
    end
  end

  M._job_id = vim.fn.jobstart(command, {
    pty = true,
    cwd = vim.fn.getcwd(),
    on_exit = function()
      callback(run_output)
    end,
    on_stdout = on_output,
    on_stderr = on_output
  })
end

return M
