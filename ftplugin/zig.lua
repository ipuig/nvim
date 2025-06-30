
local run_file = function (dir, file)
    os.execute(string.format("tmux display-popup -d %s 'zig run %s'", dir, file))
end

local run_project = function (dir)
    os.execute(string.format("tmux display-popup -d %s 'zig build run'", dir))
end

local evaluate_current_file_in_popup = function ()
    local cwd =  vim.fn.expand("%:h")
    local file = vim.fn.expand("%h")
    local has_build = os.rename("build.zig", "build.zig") and true or false

    local in_tmux = os.getenv("TMUX") ~= nil
    if in_tmux then
        if has_build then
            run_project(cwd)
        else
            run_file(cwd, file)
        end
    else
        print("Files can only be run within tmux!")
    end
end


vim.keymap.set("n", "<leader>rr", evaluate_current_file_in_popup, {})
