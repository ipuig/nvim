local run_file = function (dir, file)
    os.execute(string.format("tmux display-popup -d %s 'bash %s'", dir, file))
end

local evaluate_current_file_in_popup = function ()
    local cwd =  vim.fn.expand("%:p:h")
    local file = vim.fn.expand("%:t")

    local in_tmux = os.getenv("TMUX") ~= nil
    if in_tmux then
        run_file(cwd, file)
    else
        print("Files can only be run within tmux!")
    end
end


vim.keymap.set("n", "<leader>rr", evaluate_current_file_in_popup, {})
