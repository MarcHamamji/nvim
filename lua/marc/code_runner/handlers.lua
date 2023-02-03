local utils = require('marc.code_runner.utils')

local M = {}

M._job_id = nil

M.shell_handler = function(command)
  return function(current_buffer)
    local current_buffer_name = vim.api.nvim_buf_get_name(current_buffer)

    local buffer = utils.create_buffer('OUTPUT - ' .. current_buffer_name)
    local window = utils.create_window()

    vim.api.nvim_win_set_buf(window, buffer)

    local add_line = utils.create_add_line(buffer)

    if M._job_id then
      vim.fn.jobstop(M._job_id)
      M._job_id = nil
    end

    M._job_id = vim.fn.jobstart(command, {
      pty = true,
      cwd = vim.fn.getcwd(),
      on_stdout = add_line,
      on_stderr = add_line
    })
  end
end

M.command_handler = function (command)
  return function ()
    vim.cmd(command)
  end
end

return M
