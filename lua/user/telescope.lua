local actions = require("telescope.actions")
require("git-worktree").setup()

require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,
        cwd = require('user.workspace_path').get_git_root(),
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
                ["<CR>"] = actions.select_default,
                ["<M-l>"] = actions.preview_scrolling_up,
                ["<M-s>"] = actions.preview_scrolling_down,
            },
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
        }
    }

})
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
require("telescope").load_extension("git_worktree")

local M = {}

local function set_background(content)
    local selected_image_path = '\\\\\\\\\\\\\\\\wsl.localhost\\\\\\\\Ubuntu' .. string.gsub(content, '/', '\\\\\\\\')
    local COMMAND = "silent !sed -i -E "
    local PATTERN = '\'s/("backgroundImage").*/\\"backgroundImage": "' .. selected_image_path .. '", /\' '
    local CONFIG_FILE_PATH = '/mnt/c/Users/thiago.sousa/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json';
    vim.cmd(COMMAND .. PATTERN .. CONFIG_FILE_PATH)
end

local function select_background(prompt_bufnr, map)
    local function set_the_background(close)

        local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
        set_background(content.cwd .. "/" .. content.value)
        if close then
            require("telescope.actions").close(prompt_bufnr)
        end
    end

    map("i", "<C-p>", function()
        require("telescope.actions").move_selection_previous(prompt_bufnr)
        set_the_background()
    end)
    map("i", "<C-n>", function()
        require("telescope.actions").move_selection_next(prompt_bufnr)
        set_the_background()
    end)

    map("i", "<CR>", function()
        set_the_background(true)
    end)
end

M.anime_selector = function(prompt, cwd)
    return function()
        require("telescope.builtin").find_files({
            prompt_title = prompt,
            cwd = cwd,

            attach_mappings = function(prompt_bufnr, map)
                select_background(prompt_bufnr, map)
                return true
            end,
        })
    end
end

return M
