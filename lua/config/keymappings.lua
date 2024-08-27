local builtin = require("telescope.builtin")
local fn = require('config.myself')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})                      -- telescope find files
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})                  -- telescope grep pattern
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})                  -- telescope git files
vim.keymap.set('n', '<leader>gm', builtin.git_commits, {})                -- telescope git commits
vim.keymap.set('n', '<leader><leader>', ':Neotree toggle left<CR>', {})   -- neotree toggle
vim.keymap.set('n', '<leader>hv', fn.view_hex, {})                        -- telescope hexdump file 
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})                           -- lsp help popup
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})                     -- lsp go to definition
vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, {})                    -- lsp code actions
vim.keymap.set('n', '<M-q>', fn.build_all, {})                            -- build/format/etc all files
vim.keymap.set('v', '<M-s>', fn.wrap_selected_text, {})                   -- break text
vim.keymap.set('n', '<C-c>', fn.comment, {})                              -- comment single line
vim.keymap.set('v', '<C-c>', fn.visual_comment_cmd, {})                   -- comment selected lines
