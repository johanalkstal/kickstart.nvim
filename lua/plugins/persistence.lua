-- Saves your session so you can pick up where you left next time.

vim.keymap.set('n', '<leader>pd', function()
  require('persistence').load()
end, { desc = 'Load session for the current [d]irectory' })
vim.keymap.set('n', '<leader>ps', function()
  require('persistence').select()
end, { desc = '[S]elect session to load' })
vim.keymap.set('n', '<leader>pl', function()
  require('persistence').load { last = true }
end, { desc = 'Load [l]ast session' })
vim.keymap.set('n', '<leader>px', function()
  require('persistence').stop()
end, { desc = 'Stop Persistence. Session will not be saved on e[x]it' })

return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  },
}
