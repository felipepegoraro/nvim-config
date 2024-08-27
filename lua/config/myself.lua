local M = {}

-- numToStr/Comment.nvim
M.visual_comment_cmd = "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"

-- numToStr/Comment.nvim
function M.comment()
    require("Comment.api").toggle.linewise.current()
end

function M.build_all()
  local terminal = require("nvterm.terminal")
  local filename = vim.fn.expand("%:p")
  local filetype = vim.bo.filetype

  local function format_command(command, file)
    if type(file) == 'nil' then
      return command
    end
    return string.format(command, file)
  end

  local function run_command(command, file, _type)
    local command_to_exec = format_command(command, file)
    if _type then
      vim.cmd(command_to_exec)
    else
      terminal.send(command_to_exec)
    end
  end

  -- TODO: map = {...}
  local function select_and_run()
    if filetype == 'tex' then
      run_command("lualatex %s", filename)

    elseif filetype == 'rust' then
      run_command('!rustfmt %s --edition 2021 ; cargo run -q', filename, true);

    elseif filetype == 'python' then
      run_command("Autopep8 | q", nil, true)

    elseif filetype == 'rmd' then
      run_command('Rscript -e "rmarkdown::render(\'%s\')"', filename)

    elseif filetype == 'html' then
      run_command("echo 'go to firefox' | silent !firefox %s", filename, true)

    --elseif string.gmatch(filetype, "^((s(c|a))|c)ss$") then
    --  run_command("ColorizerToggle", nil, true)

    else
      print("+ not found.")
    end
  end

  select_and_run()
end

--local diffview_is_open = false
--function M.toggle_diff_view()
--
--  if diffview_is_open then
--    vim.api.nvim_command("DiffviewClose")
--  else
--    vim.api.nvim_command("DiffviewOpen")
--  end
--
--  diffview_is_open = not diffview_is_open
--end

function M.wrap_selected_text()
  local winwidth = vim.api.nvim_win_get_width(0)
  local start_line, end_line = unpack(vim.api.nvim_buf_get_mark(0, '<'), 1, 2), unpack(vim.api.nvim_buf_get_mark(0, '>'), 1, 2)
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  local result_lines = {}
  local min_lines = 7
  for _, line in ipairs(lines) do
    local current_line = ""
    for _, word in ipairs(vim.split(line, ' ')) do
      if #current_line + #word + min_lines > winwidth then
        table.insert(result_lines, current_line)
        current_line = word
      else
        if #current_line > 0 then
          current_line = current_line .. " " .. word
        else
          current_line = word
        end
      end
    end
    table.insert(result_lines, current_line)
  end

  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, result_lines)
end

function M.view_hex()
    require('telescope.builtin').find_files({
        prompt_title = "Select a file to view as hex",
        attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
                local entry = require('telescope.actions.state').get_selected_entry()
                local file_path = entry.path or entry[1]

                require('telescope.actions').close(prompt_bufnr)
                vim.cmd('vsplit | enew | r !xxd -g 1 ' .. file_path)
                -- TODO ~ ctrl-w 15 <
            end)
            return true
        end,
    })
end

return M
