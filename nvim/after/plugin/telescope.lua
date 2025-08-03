local telescope = require('telescope')
local actions = require('telescope.actions')
local telescope_builtin = require('telescope.builtin')
local keymap = vim.keymap
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
        ['<C-x>'] = actions.delete_buffer,
        ['<C-b>'] = actions.preview_scrolling_up,
        ['<C-f>'] = actions.preview_scrolling_down,
        ['<C-u>'] = actions.results_scrolling_up,
        ['<C-d>'] = actions.results_scrolling_down,
      },
      n = {
        ['l'] = actions.select_default,
        ['q'] = actions.close,
        ['<C-b>'] = actions.preview_scrolling_up,
        ['<C-f>'] = actions.preview_scrolling_down,
        ['<C-u>'] = actions.results_scrolling_up,
        ['<C-d>'] = actions.results_scrolling_down,
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
    },
    file_browser = {
      theme = 'ivy',
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      initial_mode = 'normal',
      mappings = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
          ['C'] = fb_actions.change_cwd,
          ['u'] = fb_actions.goto_parent_dir,
          ['h'] = fb_actions.goto_parent_dir,
          ['H'] = fb_actions.toggle_hidden,
        },
      },
    },
    zoxide = {
      -- prompt_title = "",
      mappings = {
        default = {
          after_action = function(selection)
            print("Update to (" .. selection.z_score .. ") " .. selection.path)
          end
        },
      },
    }
    -- ... also accepts theme settings, for example:
    -- theme = "dropdown", -- use dropdown theme
    -- theme = { }, -- use own theme spec
    -- layout_config = { mirror=true }, -- mirror preview pane
  }
})

-- builtin
keymap.set('n', '<Leader>f', function() telescope_builtin.find_files() end)
keymap.set('n', '<Leader>f<Space>', telescope_builtin.resume, {})
keymap.set('n', '<Leader>f<Leader>', telescope_builtin.find_files, {})
keymap.set('n', '<Leader>fb', telescope_builtin.buffers, {})
keymap.set('n', '<Leader>ff', telescope_builtin.find_files, {})
keymap.set('n', '<Leader>fh', telescope_builtin.help_tags, {})
keymap.set('n', '<Leader>fk', telescope_builtin.keymaps, {})

-- file browser
telescope.load_extension("file_browser")

keymap.set('n', '<Leader>n', telescope.extensions.file_browser.file_browser, {})
keymap.set('n', '<Leader><Space>',
  function() telescope.extensions.file_browser.file_browser({ path = vim.fn.expand('%:p:h') }) end)
keymap.set('n', '<Leader>`', function() telescope.extensions.file_browser.file_browser({ path = "~/.config/nvim" }) end)

-- live grep
keymap.set('n', '<Leader>fg.', telescope.extensions.live_grep_args.live_grep_args)
keymap.set('n', '<Leader>fgg',
  function() telescope.extensions.live_grep_args.live_grep_args({ search_dirs = { 'gti_client', 'atom', 'atom_us', 'nor-code', 'ewap', 'vegaracer' } }) end)
keymap.set('n', '<Leader>fge',
  function() telescope.extensions.live_grep_args.live_grep_args({ search_dirs = { 'ewap' } }) end)
keymap.set('n', '<Leader>fgv',
  function() telescope.extensions.live_grep_args.live_grep_args({ search_dirs = { 'vegaracer' } }) end)
keymap.set('n', '<Leader>fgn',
  function() telescope.extensions.live_grep_args.live_grep_args({ search_dirs = { 'nor-code' } }) end)
keymap.set('n', '<Leader>fgi',
  function() telescope.extensions.live_grep_args.live_grep_args({ search_dirs = { 'infra-gui-base' } }) end)

-- zoxide
telescope.load_extension('zoxide')
keymap.set('n', '<Leader>fz', telescope.extensions.zoxide.list)
