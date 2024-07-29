---Change indentation to num in local or global
---@param num number it must be number and it can't be 0.
---@param scope "global" | "local"
local function set_indent(num, scope)
  vim.api.nvim_set_option_value("tabstop", num, { scope })
  vim.api.nvim_set_option_value("shiftwidth", num, { scope })
  vim.api.nvim_set_option_value("softtabstop", num, { scope })
end

---Change indentation to num in `vim.o`.
---@param bufnr integer
---@param num number it must be number and it can't be 0.
local function set_buf_indent(bufnr, num)
  vim.api.nvim_set_option_value("tabstop", num, { buf = bufnr })
  vim.api.nvim_set_option_value("shiftwidth", num, { buf = bufnr })
  vim.api.nvim_set_option_value("softtabstop", num, { buf = bufnr })
end

---Change indent to num
---@param n any In this function will convert it to `number`
---@param is_global boolean if true, set all buffers indentation
local function change_indent(n, is_global)
  local num = tonumber(n)
  if is_global and num then
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      set_buf_indent(bufnr, num)
    end
    set_indent(num, "global")
    print("All Indentations are set to " .. num)
  elseif num then
    local bufnr = vim.api.nvim_get_current_buf();
    set_indent(num, "local")
    print(bufnr .. " Indentation is set to " .. num)
  else
    print("Invalid num" .. n)
  end
end

vim.api.nvim_create_user_command("ChangeIndent", function(opts)
  local args = vim.split(opts.args, " ")
  local num = args[1]
  local is_global = vim.tbl_contains(args, "g") or vim.tbl_contains(args, "global")

  change_indent(num, is_global)
end, { nargs = "+" }

)
