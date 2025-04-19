# 🧠 Joshua's Neovim Config

A modern Neovim setup built with Lua and Packer, designed for power users and minimalist developers alike. This configuration includes intelligent autocompletion, LSP integration, fuzzy finding, debugging tools, session management, and beautiful visuals—all optimized for a smooth and efficient development experience.

## ✨ Description

This Neovim configuration automates the installation and management of a full-featured development environment. On startup, it:

- Bootstraps and installs plugins using **Packer**
- Provides blazing-fast navigation and fuzzy search with **Telescope**
- Enables rich syntax highlighting and structure awareness via **Treesitter**
- Offers built-in **LSP support**, autocompletion, and snippets using **lsp-zero**
- Adds UI enhancements like a **file explorer**, **indent guides**, and a slick **Dracula theme**
- Powers up your workflow with **auto session restore**, **undo history**, and **Git integration**
- Supports full **debugging capabilities** with **nvim-dap** and **dap-ui**

Perfect for anyone seeking a fast, clean, and highly extendable Neovim setup.

## ⚙️ Setup

1. **Clone this repository:**

```bash
git clone git@github.com:JoshuaDarron/nvim.git ~/.config/nvim
cd ~/.config/nvim
```

2. **Install Packer (plugin manager):**

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

3. **Launch Neovim and run:**

```bash
:PackerSync
```

This will install and configure all required plugins.

## 🚀 Usage

Once installed, enjoy features like:

- `:Telescope find_files` — Quickly search and open files
- `:NvimTreeToggle` — Toggle file tree explorer
- `:UndotreeToggle` — Visualize undo history
- LSP: Go to definition, hover docs, and diagnostics out of the box
- Debugging with `nvim-dap` and `dap-ui`
- Sessions automatically saved and restored with `auto-session`

Make sure to create a `config/dap.lua` file for custom debug adapter settings if using `nvim-dap`.

## 👤 Authors

[Joshua Phillips](https://github.com/JoshuaDarron)

