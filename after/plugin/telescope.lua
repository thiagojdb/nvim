require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = false,
      }
})

require("telescope").load_extension("ui-select")
