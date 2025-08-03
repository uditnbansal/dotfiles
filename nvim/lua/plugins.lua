return {
  {
    'folke/neodev.nvim',
    config = function()
      require('neodev').setup({})
    end,
  },

  -- WhichKey
  -- (disables gotodefinition) -- disable for now
  -- {
  --   'folke/which-key.nvim',
  --   event = 'VeryLazy',
  --   init = function()
  --     vim.o.timeout = true
  --     vim.o.timeoutlen = 300
  --   end,
  -- },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' }
    }
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  },
  {
    'jvgrootveld/telescope-zoxide',
    dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' }
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine'
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        background = {
          light = 'frappe',
          dark = 'mocha',
        },
        dim_inactive = {
          enabled = true,
          shade = 'light',
          percentage = 0.9,
        },
        integrations = {
          notify = true,
        },
      })

      vim.cmd.colorscheme('catppuccin')
    end,
  },
  'tomasiser/vim-code-dark',
  'ellisonleao/gruvbox.nvim',

  -- Treesitter
  -- (segfaults) -- disable for now
  -- {
  -- 	'nvim-treesitter/nvim-treesitter',
  -- 	build = ':TSUpdate',
  -- 	config = function()
  -- 		require('nvim-treesitter.configs').setup({
  -- 			ensure_installed = { "c", "cpp", "lua", },
  -- 			sync_install = true,
  -- 			auto_install = true,
  -- 			highlight = {
  -- 				enable = true,
  -- 				additional_vim_regex_highlighting = true,
  -- 			},
  -- 		})
  -- 		vim.opt.foldmethod = 'expr'
  -- 		vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
  -- 	end,
  -- },

  -- Undotree
  'mbbill/undotree',

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'ms-jpq/coq_nvim' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      -- Snippet Collection (Optional)
      { 'rafamadriz/friendly-snippets' },
    }
  },

  -- Auto Complete
  'nvim-lua/completion-nvim',

  -- tpope's essential plugins
  'tpope/vim-abolish',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',

  -- fswitch
  'derekwyatt/vim-fswitch',

  -- devicons
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      local devicons = require('nvim-web-devicons')
      devicons.get_icons()
      devicons.setup({
        override = {
          zsh = {
            icon = '',
            color = '#428850',
            cterm_color = '65',
            name = 'Zsh'
          }
        },
        color_icons = true,
        default = true,
      })
    end,
  },

  -- autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true
  },

  -- lualine (statusline)
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          theme = 'catppuccin',
          section_separators = { left = '', right = '' }
        },
        sections = {
          lualine_c = {
            {
              'filename',
              path = 1
            }
          }
        },
        inactive_sections = {
          lualine_c = {
            {
              'filename',
              path = 1
            }
          }
        }
      })
    end,
  },

  -- scratch plugin
  'mtth/scratch.vim',

  -- hop (for quick movements)
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection

      hop.setup({
        keys = 'etovxqpdygfblzhckisuran'
      })

      vim.keymap.set('n', '<Leader><Leader>b', function() hop.hint_words({ direction = directions.BEFORE_CURSOR }) end)
      vim.keymap.set('n', '<Leader><Leader>j', function() hop.hint_lines({ direction = directions.AFTER_CURSOR }) end)
      vim.keymap.set('n', '<Leader><Leader>k', function() hop.hint_lines({ direction = directions.BEFORE_CURSOR }) end)
      vim.keymap.set('n', '<Leader><Leader>w', function() hop.hint_words({ direction = directions.AFTER_CURSOR }) end)
    end,
  },

  -- bufferline
  {
    'akinsho/bufferline.nvim',
    version = '*',
    config = function()
      require('bufferline').setup({
        highlights = require('catppuccin.groups.integrations.bufferline').get()
      })
    end,
  },

  -- tmux integration
  {
    'aserowy/tmux.nvim',
    config = function()
      local tmux = require('tmux')
      tmux.setup({
        copy_sync = {
          enable = false
        },
        navigation = {
          enable_default_keybindings = false
        }
      })
      vim.keymap.set('n', '<C-h>', tmux.move_left)
      vim.keymap.set('n', '<C-j>', tmux.move_bottom)
      vim.keymap.set('n', '<C-k>', tmux.move_top)
      vim.keymap.set('n', '<C-l>', tmux.move_right)
    end,
  },

  -- indent-blankline
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
    config = function()
      require('ibl').setup({ enabled = false })
    end,
  },

  -- comment plugin
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  -- gitsigns
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 2000,
          ignore_whitespace = true,
          virt_text_priority = 100,
        },
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({ ']c', bang = true })
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({ '[c', bang = true })
            else
              gitsigns.nav_hunk('prev')
            end
          end)

          -- Actions
          map('n', '<leader>hs', gitsigns.stage_hunk)
          map('n', '<leader>hr', gitsigns.reset_hunk)
          map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
          map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
          map('n', '<leader>hS', gitsigns.stage_buffer)
          map('n', '<leader>hu', gitsigns.undo_stage_hunk)
          map('n', '<leader>hR', gitsigns.reset_buffer)
          map('n', '<leader>hp', gitsigns.preview_hunk)
          map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
          map('n', '<leader>hd', gitsigns.diffthis)
          map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
          map('n', '<leader>td', gitsigns.toggle_deleted)

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      })
    end,
  },

  -- lazygit
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' }
    }
  },
}
