local M = {}

M.shell_handler = function(command)
  return function()
    local bufnr = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)

    vim.cmd [[ vsplit ]]
    local winnr = vim.api.nvim_get_current_win()
    -- TODO: Set windows options

    vim.api.nvim_win_set_buf(winnr, bufnr)

    local add_line = function(_, data)
      vim.api.nvim_buf_set_option(bufnr, 'modifiable', true)
      local row = vim.api.nvim_buf_line_count(bufnr) - 1
      local col = vim.fn.len(vim.api.nvim_buf_get_lines(bufnr, -2, -1, false)[1])
      vim.api.nvim_buf_set_text(bufnr, row, col, row, col, data)
      vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
    end

    vim.fn.jobstart(command, {
      cwd = vim.fn.getcwd(),
      on_stdout = add_line,
      on_stderr = add_line
    })
  end
end

return M
