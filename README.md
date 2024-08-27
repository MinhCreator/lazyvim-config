# 💤 Lazy Code
This my config LazyVim and I call that "Lazy Code". If you refer original repo, you should checkout to LazyVim webpage
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



# ⚙️ Configuration

## You need to visit [LazyVim](https://www.lazyvim.org/configuration) to see full Documents and Configuration  
