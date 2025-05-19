return {
  "arakkkkk/kanban.nvim",
  -- Optional
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    require("kanban").setup({
      markdown = {
        description_folder = "/home/adjoly/Nextcloud/task/desc", -- Path to save the file corresponding to the task.
        list_head = "## ",
      },
    })
  end,
}
