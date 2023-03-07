local builtin = require('telescope.builtin');

vim.keymap.set("n", "<leader>ps", function()
  builtin.grep_string({ search = vim.fn.input("Grep For > ") })
end)

vim.keymap.set("n", "<Leader>pa", function()
  builtin.find_files()
end)

vim.keymap.set("n", "<Leader>pf", function()
  builtin.find_files({
    prompt_title = 'Find in Project/Module',
    cwd = require('user.workspace_path').get_git_root(),
    hidden = true,
  })
end)

vim.keymap.set("n", "<leader>pw", function()
  builtin.grep_string { search = vim.fn.expand("<cword>") }
end)

vim.keymap.set("n", "<leader>pb", function()
  builtin.buffers()
end)

vim.keymap.set("n", "<leader>vh", function()
  builtin.help_tags()
end)

vim.keymap.set("n", "<leader>vrc", function()
  builtin.git_files({
    prompt_title = "< VimRC >",
    cwd = '~/.config/nvim',
    hidden = true,
  })
end)

vim.keymap.set("n", "<leader>sb", function()
  builtin.anime_selector("< Anime Bobs > ", "~/anime")
end)

vim.api.nvim_create_user_command('TelescopeGitStatus', function()
  builtin.git_status({
    prompt_title = 'Git Status in Project/Module',
    cwd = require('user.workspace_path').get_git_root(),
    hidden = true,
  })
end, { nargs = 0 })


vim.api.nvim_create_user_command('WorktreeList', function()
  require('telescope').extensions.git_worktree.git_worktrees()
end, { nargs = 0 })

vim.api.nvim_create_user_command('WorktreeCreate', function()
  require('telescope').extensions.git_worktree.create_git_worktree()
end, { nargs = 0 })


vim.api.nvim_create_user_command('WorktreeCreateSome', function(arg)
  print(arg['args'])
--require("git-worktree").create_worktree("feat-69", "master", "origin")
end, { nargs = '?' })
