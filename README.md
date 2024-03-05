# nvim
Very Basic Neovim Configuration.
LSP setup is based on [kickstarer.nvim](https://github.com/nvim-lua/kickstart.nvim)

## Key Plugins
- Package Manager : 
    - [folke/Lazy.nvim](https://github.com/folke/lazy.nvim)
- LSP
    - [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
    - [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
        - this is probably not required, I just use it to ensure install lua_ls
    - [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- Fuzzy Find
    - [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
        - make sure to download ripgrep and add its path to system PATH for users.
- Syntax Highlight
    - [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Workspaces and Sessions
    - [natecraddock/workspaces.nvim](https://github.com/natecraddock/workspaces.nvim)
    - [Shatur/neovim-session-manager](https://github.com/Shatur/neovim-session-manager)

