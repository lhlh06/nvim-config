local function change_indent(num)
    local n = tonumber(num)
    if n then
        vim.o.tabstop = n
        vim.o.shiftwidth = n
        vim.o.softtabstop = n
        print("Indention is set to " .. n)
    else
        print("Invalid num" .. num)
    end
end

vim.api.nvim_create_user_command("ChangeIndent", function(opts)
    change_indent(opts.args)
end, { nargs = 1 }

)
