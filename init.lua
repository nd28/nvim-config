-- Set ripgrep for search
vim.opt.grepprg = "rg --vimgrep -C=1"
-- Result in the format neovim can understand
vim.opt.grepformat = "%f:%l:%c:%m"

-- Set theme
vim.cmd('colorscheme retrobox')
vim.cmd('set nu')

-- Set your leader key (e.g., space)
vim.g.mapleader = ' '

-- Path options for efficient file finding
vim.opt.path = '.,,**'
vim.opt.wildmenu = true
vim.opt.wildignore = '*.o,*.obj,*.pyc,node_modules,.git'

-- Keymaps to navigate the quickfix list
vim.keymap.set('n', '<leader>h', '<cmd>cnext<CR>zz', { desc = 'Next Quickfix entry' })
vim.keymap.set('n', '<leader>;', '<cmd>cprev<CR>zz', { desc = 'Previous Quickfix entry' })
vim.keymap.set('n', '<leader>q', '<cmd>cclose<CR>', { desc = 'Close Quickfix' })
vim.keymap.set('n', '<leader>o', '<cmd>copen<CR>', { desc = 'Open Quickfix' })

-- File search
vim.keymap.set('n', '<leader>ff', ':find ', { desc = 'Find file by name' })
vim.keymap.set('n', '<leader>fg', ':grep! ', { desc = 'Grep in files' })
vim.keymap.set('n', '<leader>fr', ':find *.', { desc = 'Find in current dir' })

-- JSON treesitter (built-in in v0.12.0)
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.json',
  callback = function()
    --vim.treesitter.start()
  end,
})

-- JSON formatting with jq
vim.keymap.set('n', '<leader>fj', ':%!jq .<CR>', { desc = 'Format JSON' })
vim.keymap.set('n', '<leader>jq', ':%!jq -e . > /dev/null<CR>', { desc = 'Validate JSON' })

-- Git operations
vim.keymap.set('n', '<leader>lg', '<cmd>terminal lazygit<CR>', { desc = 'Open LazyGit' })
vim.keymap.set('n', '<leader>gl', ':terminal git log --oneline -10<CR>', { desc = 'Git log' })
vim.keymap.set('n', '<leader>ga', ':terminal git add ', { desc = 'Git add file' })
vim.keymap.set('n', '<leader>gd', ':terminal git diff<CR>', { desc = 'Git diff' })
vim.keymap.set('n', '<leader>gdc', ':terminal git diff --cached<CR>', { desc = 'Git diff staged' })
vim.keymap.set('n', '<leader>gc', ':terminal git commit<CR>', { desc = 'Git commit' })
vim.keymap.set('n', '<leader>gr', ':terminal git remote -v<CR>', { desc = 'Git remote' })


-- Git status to quickfix
vim.keymap.set('n', '<leader>gs', function()
  local output = vim.fn.system('git status --porcelain')
  if vim.v.shell_error ~= 0 then
    vim.notify('Not a git repository', vim.log.WARN)
    return
  end
  
  local items = {}
  for line in string.gmatch(output, '[^\r\n]+') do
    local file = string.sub(line, 4)
    if file ~= '' then
      local status = string.sub(line, 1, 2)
      table.insert(items, {
        filename = file,
        text = line,
        valid = 1,
      })
    end
  end
  
  if #items == 0 then
    vim.notify('No changes', vim.log.INFO)
    return
  end
  
  vim.fn.setqflist(items, 'r')
  vim.cmd('copen')
end, { desc = 'Git status to quickfix' })

-- Buffer/Window
vim.keymap.set('n', '<leader>w', '<cmd>write<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>x', '<cmd>write<CR><cmd>bd<CR>', { desc = 'Save & close' })

-- Search & Replace
vim.keymap.set('n', '<leader>sr', ':%s/', { desc = 'Search & replace' })

-- Edit config
vim.keymap.set('n', '<leader>ev', '<cmd>e $MYVIMRC<CR>', { desc = 'Edit config' })

-- Window splits
vim.keymap.set('n', '<leader>sv', '<cmd>split<CR>', { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>sh', '<cmd>vsplit<CR>', { desc = 'Split horizontal' })
vim.keymap.set('n', '<leader>sc', '<cmd>close<CR>', { desc = 'Close split' })

-- Terminal
vim.keymap.set('n', '<leader>tt', '<cmd>terminal<CR>', { desc = 'Open terminal' })
vim.keymap.set('t', '<Esc>', '<Ctrl-\\><C-n>', { desc = 'Exit terminal' })

-- Scroll
vim.keymap.set('n', 'zt', 'zt', { desc = 'Cursor to top' })
vim.keymap.set('n', 'zb', 'zb', { desc = 'Cursor to bottom' })
vim.keymap.set('n', 'zz', 'zz', { desc = 'Cursor to middle' })
