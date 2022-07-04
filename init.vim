let mapleader = " "

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
" Themes
Plug 'sainnhe/everforest'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'navarasu/onedark.nvim'
Plug 'morhetz/gruvbox'

" Git
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Scala metal (or needed for it
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'scalameta/nvim-metals'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
" Plug 'akinsho/toggleterm.nvim', {'tag' : 'v1.*'}
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v1.*'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
set number relativenumber
set signcolumn=yes:2
syntax on
" set cursorline

" Colorscheme
if has('termguicolors')
    set termguicolors
endif

" For dark version.
set background=dark
    
"For light version.
" set background=light
 
" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'soft'

" For better performance
let g:everforest_better_performance = 1
 

let g:airline_theme='transparent'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" colorscheme everforest
colorscheme everforest
" Transparent background
highlight Normal guibg=none
highlight NonText guibg=none
highlight VertSplit ctermbg=NONE
highlight VertSplit ctermfg=NONE
hi EndOfBuffer guibg=none ctermbg=none
" highlight NonText ctermbg=NONE guibg=NONE
" Telescope bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader><leader>w <Plug>(easymotion-bd-w)
nnoremap <leader>L <Plug>(easymotion-overwin-line)
" Scala metals 
nnoremap <silent>gd          <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>K           <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent>gi          <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>gr          <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent>gwd         <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent>gws         <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent><leader>rn  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent><leader>fo   <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent><leader>k  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><leader>ws  <cmd>lua require'metals'.worksheet_hover()<CR>
" nnoremap <silent><leader>a   <cmd>lua require'metals'.open_all_diagnostics()<CR>
nnoremap <silent><leader>a   <cmd>lua vim.diagnostic.setqflist()<CR>
nnoremap <silent>[c          <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>
nnoremap <silent>]c          <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>
nnoremap <silent><leader>mm <cmd>lua require"telescope".extensions.metals.commands()<CR>

" Mapping for dap (debugging)
nnoremap <silent> <leader>dt <cmd>lua require'dap'.toggle_breakpoint()<cr>
nnoremap <silent> <leader>dc <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <leader>dso <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <leader>dsd <Cmd>lua require'dap'.down()<CR>
nnoremap <silent> <leader>dsi <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl <Cmd>lua require'dap'.run_last()<CR>
nnoremap <silent> <leader>dK <Cmd>lua require'dap.ui.widgets'.hover()<CR>
nnoremap <silent> <leader>dC <Cmd>lua require'dap'.terminate()<CR>
nnoremap <silent> <leader>dui <cmd>lua require'dapui'.toggle()<cr>

" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Toggleterm
" autocmd TermEnter term://*toggleterm#*
"       \ tnoremap <silent><leader>p <Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>
"nnoremap <silent><leader>p <Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>
"inoremap <silent><leader>p <Esc><Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>

" Used for nerd commenter
filetype plugin on

" Autoformating
"-----------------------------------------------------------------------------
" nvim-metals setup with a few additions such as nvim-completions
"-----------------------------------------------------------------------------
:lua << EOF
  metals_config = require'metals'.bare_config()
  metals_config.settings = {
     showImplicitArguments = true,
     excludedPackages = {
       "akka.actor.typed.javadsl",
       "com.github.swagger.akka.javadsl"
     }
  }

  metals_config.on_attach = function()
    require'completion'.on_attach();
  end

  metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        prefix = '',
      }
    }
  )
EOF

if has('nvim-0.5')
  augroup lsp
    au!
    au FileType scala,sbt lua require('metals').initialize_or_attach(metals_config)
  augroup end
endif

"-----------------------------------------------------------------------------
" completion-nvim settings
"-----------------------------------------------------------------------------
" Use <Tab> and <S-Tab> to navigate through popup menu

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
:lua  <<EOF
  local cmp = require("cmp")
  cmp.setup({
    sources = {
      { name = "nvim_lsp" },
      { name = "vsnip" },
    },
    snippet = {
      expand = function(args)
        -- Comes from vsnip
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      -- None of this made sense to me when first looking into this since there
      -- is no vim docs, but you can't have select = true here _unless_ you are
      -- also using the snippet stuff. So keep in mind that if you remove
      -- snippets you need to remove this select
      -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      -- I use tabs... some say you should stick to ins-completion but this is just here as an example
      ["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
    }),
  })
EOF

:lua <<EOF
  -- Debug settings if you're using nvim-dap
  local dap = require("dap")
  
  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "RunOrTest",
      metals = {
        runType = "runOrTestFile",
        --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
  }
  
  metals_config.on_attach = function(client, bufnr)
    require("metals").setup_dap()
  end
EOF
"-----------------------------------------------------------------------------
" Helpful general settings
"-----------------------------------------------------------------------------
" Needed for compltions _only_ if you aren't using completion-nvim
autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Avoid showing message extra message when using completion
set shortmess+=c

" Ensure autocmd works for Filetype
set shortmess-=F

" DAP UI
:lua <<EOF
  require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7"),
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
      {
        elements = {
        -- Elements can be strings or table with id and size keys.
          { id = "scopes", size = 0.25 },
          "breakpoints",
          "stacks",
          "watches",
        },
        size = 40, -- 40 columns
        position = "left",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 0.25, -- 25% of total lines
        position = "bottom",
      },
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = "single", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil, -- Can be integer or nil.
    }
  })
EOF
