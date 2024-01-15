local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup {
  pickers = {
    find_files = {
      hidden = true
    }
  },
  defaults = {
    file_ignore_patterns = {
      '.git/', '.cache', '%.o', '%.a', '%.out', '%.class',
    },
    -- Configure layout of interface
    sorting_strategy = 'ascending', -- display results top -> bottom
    layout_config = {
      prompt_position = 'top',
    }
  }
}

-- Kebindings
-- Find Files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- Find Git files
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
-- Grep entire working directory for any term
vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
