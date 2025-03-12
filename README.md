# 💤 Lazy Code
This my config LazyVim and I call that "Lazy Code". If you refer original repo, you should checkout to LazyVim webpage

<a href="https://dotfyle.com/MinhCreator/lazyvim-config"><img src="https://dotfyle.com/MinhCreator/lazyvim-config/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/MinhCreator/lazyvim-config"><img src="https://dotfyle.com/MinhCreator/lazyvim-config/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/MinhCreator/lazyvim-config"><img src="https://dotfyle.com/MinhCreator/lazyvim-config/badges/plugin-manager?style=flat" /></a>
---
## Original Repo
A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## ⚡️ Requirements

- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional)_**
- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- NodeJs to using npm this dependencies for [Mason.nvim](https://github.com/williamboman/mason.nvim) **_(optional)_**

# 🛠️ Installation

You can find a template for **Lazy Code** [here](https://github.com/MinhCreator/lazyvim-config)

Install the [Lazy Code](https://github.com/MinhCreator/lazyvim-config)

- For Linux/MacOS
- Make a backup of your current Neovim files:

  ```sh
  # required
  mv ~/.config/nvim{,.bak}

  # optional but recommended
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}
  ```

- Clone the starter

  ```sh
  git clone https://github.com/MinhCreator/lazyvim-config ~/.config/nvim
  ```

- Remove the `.git` folder, so you can add it to your own repo later

  ```sh
  rm -rf ~/.config/nvim/.git
  ```

- Start Neovim!

  ```sh
  nvim
  ```

  Refer to the comments in the files on how to customize **Lazy Code**.


-
	Install the [Lazy Code](https://github.com/MinhCreator/lazyvim-config)  for Windows via using [PowerShell](https://github.com/PowerShell/PowerShell)

- Make a backup of your current Neovim files:

  ```powershell
  # required
  Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

  # optional but recommended
  Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
  ```

- Clone the starter

  ```powershell
  git clone https://github.com/MinhCreator/lazyvim-config $env:LOCALAPPDATA\nvim
  ```

- Remove the `.git` folder, so you can add it to your own repo later

  ```powershell
  Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
  ```

- Start Neovim!

  ```powershell
  nvim
  ```

  Refer to the comments in the files on how to customize **Lazy Code**.





	```sh
	docker run -w /root -it --rm alpine:edge sh -uelic '
	apk add git lazygit neovim ripgrep alpine-sdk --update
    git clone	https://github.com/MinhCreator/lazyvim-config ~/.config/nvim
    cd ~/.config/nvim
	nvim'

	```	
	**Tip**:
		It is recommended to run `:LazyHealth` after installation.
		This will load all plugins and check if everything is working correctly.
## Plugins

### code-runner

+ [Zeioth/compiler.nvim](https://dotfyle.com/plugins/Zeioth/compiler.nvim)
+ [stevearc/overseer.nvim](https://dotfyle.com/plugins/stevearc/overseer.nvim)
### color

+ [brenoprata10/nvim-highlight-colors](https://dotfyle.com/plugins/brenoprata10/nvim-highlight-colors)
### colorscheme

+ [projekt0n/github-nvim-theme](https://dotfyle.com/plugins/projekt0n/github-nvim-theme)
+ [0xstepit/flow.nvim](https://dotfyle.com/plugins/0xstepit/flow.nvim)
+ [alexmozaidze/palenight.nvim](https://dotfyle.com/plugins/alexmozaidze/palenight.nvim)
+ [samharju/synthweave.nvim](https://dotfyle.com/plugins/samharju/synthweave.nvim)
+ [navarasu/onedark.nvim](https://dotfyle.com/plugins/navarasu/onedark.nvim)
+ [rebelot/kanagawa.nvim](https://dotfyle.com/plugins/rebelot/kanagawa.nvim)
+ [sekke276/dark_flat.nvim](https://dotfyle.com/plugins/sekke276/dark_flat.nvim)
+ [scottmckendry/cyberdream.nvim](https://dotfyle.com/plugins/scottmckendry/cyberdream.nvim)
+ [tiagovla/tokyodark.nvim](https://dotfyle.com/plugins/tiagovla/tokyodark.nvim)
### comment

+ [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
### completion

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### cursorline

+ [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate)
### diagnostics

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
### editing-support

+ [nvim-treesitter/nvim-treesitter-context](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-context)
+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
### file-explorer

+ [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)
### formatting

+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### icon

+ [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
### indent

+ [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)
### lsp

+ [linrongbin16/lsp-progress.nvim](https://dotfyle.com/plugins/linrongbin16/lsp-progress.nvim)
+ [mfussenegger/nvim-lint](https://dotfyle.com/plugins/mfussenegger/nvim-lint)
+ [j-hui/fidget.nvim](https://dotfyle.com/plugins/j-hui/fidget.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### media

+ [3rd/image.nvim](https://dotfyle.com/plugins/3rd/image.nvim)
### motion

+ [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)
### nvim-dev

+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
+ [nvim-lua/popup.nvim](https://dotfyle.com/plugins/nvim-lua/popup.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### preconfigured

+ [LazyVim/LazyVim](https://dotfyle.com/plugins/LazyVim/LazyVim)
### snippet

+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
### startup

+ [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### terminal-integration

+ [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim)
### utility

+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
+ [echasnovski/mini.animate](https://dotfyle.com/plugins/echasnovski/mini.animate)
+ [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)
## Language Servers
+ html
+ pyright
+ ruff_lsp
+ zk

# ⚙️ Configuration

## You need to visit [LazyVim](https://www.lazyvim.org/configuration) to see full Documents and Configuration  
