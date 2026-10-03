# My Neovim configuration

A personal Neovim setup built with Lua, Catppuccin, and a growing collection of tools
for writing code and getting around it.

![Lua](https://img.shields.io/badge/config-Lua-2C2D72?style=flat-square&logo=lua&logoColor=white)
![Catppuccin](https://img.shields.io/badge/theme-Catppuccin%20Mocha-cba6f7?style=flat-square)
![lazy.nvim](https://img.shields.io/badge/plugins-lazy.nvim-a6e3a1?style=flat-square)

[Features](#-features) · [Setup](#-setup) · [Keymaps](#-keymaps) · [Structure](#-structure)

My personal Neovim config, tweaked as my workflow changes. Borrow whatever
fits your setup.

## ✨ Features

- **UI:** Catppuccin Mocha, Lualine, Bufferline, and Zen mode.
- **Navigation:** Snacks pickers, Oil, Harpoon, and Flash.
- **Code:** native LSP, Blink completion, Treesitter, and Conform formatting.
- **Tools:** Lazygit, GitHub pickers, nvim-dap, and an integrated terminal.
- **Writing:** Markview for Markdown; VimTeX and Texlab for LaTeX.
- **Extras:** saved sessions, persistent undo, and Sidekick / Copilot integrations.

## 🔧 Setup

### Prerequisites

- A recent Neovim with `vim.lsp.config` / `vim.lsp.enable` support (0.11+ for those
  APIs). Plugins may require a newer release.
- Git to bootstrap the plugin manager and download plugins.
- A terminal with true color support and a Nerd Font for the configured icons.
- `ripgrep` for searching project contents; `fd` is useful for file discovery.
- A C compiler and the build tools required by the Treesitter parsers you install.

Install external tools for the features you use:

| Feature | External tools |
| --- | --- |
| Linux clipboard | `wl-copy` / `wl-paste`, `xclip`, or `xsel`; otherwise the config falls back to OSC 52 |
| Windows clipboard | `win32yank.exe` preferred; a PowerShell fallback is configured |
| Git UI | `lazygit` |
| GitHub pickers | `gh`, authenticated with your GitHub account |
| LaTeX | A TeX distribution, `latexmk`, `zathura`, and `chktex` for linting |
| AI CLI sessions | Your chosen AI CLI; the configured multiplexer backend is `zellij` |
| Copilot | `copilot-language-server` on `PATH` and Copilot authentication |
| LSP | Language servers for your languages; see [Language tools](#language-tools) |
| Formatting | Formatter executables listed in [conform.lua](lua/plugins/code/conform.lua) |
| Debugging | The relevant debugger and runtime; see `lua/plugins/code/dap/` |

### Install

For Linux or macOS, clone into Neovim's config directory. Move an existing config aside
first, if you have one.

```sh
git clone https://github.com/JktuJQ/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
nvim
```

On Windows, clone into `%LOCALAPPDATA%\nvim` instead.

On the first launch, the config bootstraps **lazy.nvim** and installs the plugins. Let
installation finish, then restart Neovim.

To try it alongside an existing setup on Linux or macOS:

```sh
git clone https://github.com/JktuJQ/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}/nvim-jktujq"
NVIM_APPNAME=nvim-jktujq nvim
```

Use the same `NVIM_APPNAME` when launching it again.

### Language tools

The config defines these language servers:

| Language | Server |
| --- | --- |
| Lua | `lua_ls` |
| Nix | `nil_ls` |
| Python | `basedpyright` |
| C / C++ | `clangd` |
| Rust | `rust_analyzer` |
| Haskell | `hls` |
| LaTeX | `texlab` |

The LSP `ensure_installed` list is empty, so install the servers you need through
`:Mason` or your system / project environment. Formatters are configured separately in
[conform.lua](lua/plugins/code/conform.lua) and also need to be installed. Formatting is
triggered manually with `<leader>cf`.

Install syntax parsers with `:TSInstall <language>`.
Use `:checkhealth`, `:checkhealth vim.lsp`, and `:ConformInfo` to inspect your setup.

### Development shell

The repository includes a development shell for working on the Lua config:

```sh
nix develop
```

The shell provides Lua 5.4, LuaRocks, Lua Language Server, and StyLua.
Neovim and the other language tools are installed separately.

The included `.envrc` uses `use flake`. With direnv and nix-direnv configured,
run this once in the repository to load the shell automatically when you enter it:

```sh
direnv allow
```

## ⌨️ Keymaps

`<leader>` is **Space** and `<localleader>` is **backslash**. These are a few of the
everyday mappings; `<leader>fk` opens the searchable keymap picker.

### Find & navigate

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Search project contents |
| `<leader>fw` | Search for the word under the cursor |
| `<leader>fb` / `<leader>fr` | Buffers / recent files |
| `<leader>fp` | Projects |
| `<leader>o` | Open Oil in a floating window |
| `<C-m>` | Open the sidebar explorer |
| `s` | Flash jump |
| `<leader>ha` | Add the current file to Harpoon |
| `<leader>h` | Open the Harpoon menu |
| `<leader>h1` … `<leader>h5` | Jump to a Harpoon file |

### Code & tools

| Key | Action |
| --- | --- |
| `H` | Hover documentation |
| `<leader>fd` / `<leader>fu` | Definitions / references |
| `<leader>fs` / `<leader>fS` | Document / workspace symbols |
| `<leader>rn` | Rename symbol |
| `<leader>la` | Code action |
| `<leader>le` | Show line diagnostics |
| `<leader>cf` | Format the buffer or selection with Conform |
| `<leader>gg` | Open Lazygit |
| `<leader>gs` / `<leader>gd` | Git status / diff picker |
| `<leader>gi` / `<leader>gp` | GitHub issues / pull requests |
| `<leader>db` / `<leader>dc` | Toggle breakpoint / start or continue debugging |
| `<leader>ds` / `<leader>di` | Step over / into |
| `<leader>du` | Toggle the debugger UI |
| `<leader>ai` | Toggle an AI CLI session |
| `<leader>asv` | Send the visual selection to the AI CLI |
| `<localleader>ll` / `<localleader>lv` | Compile / view LaTeX with VimTeX |

### Everyday editing

| Key | Action |
| --- | --- |
| `kk` in insert mode | Return to normal mode |
| `yf` | Copy the whole file to the clipboard |
| `<C-h/j/k/l>` | Move between splits |
| `<C-t>` | Toggle the terminal |
| `<C-Space>` in terminal mode | Return to normal mode |
| `<A-h>` / `<A-l>` | Previous / next buffer |
| `<A-q>` | Delete the current buffer while keeping the window layout |
| `<leader>ql` / `<leader>qs` | Restore / select a session |
| `<leader>ut` | Toggle the undo tree |
| `<leader>ttz` | Toggle Zen mode |
| `<leader>ttw` | Toggle line wrapping |
| `<leader>tte` | Toggle diagnostics |

Treesitter text objects include `if` / `af` for functions, `ic` / `ac` for classes, and
`i,` / `a,` for parameters. Cutlass changes the usual delete / change register behavior,
so check [its config](lua/plugins/editor/cutlass.lua) if you rely on Vim's default cut
workflow.

## 📂 Structure

```text
init.lua                      Entry point
lua/
├── core/                     Options, keymaps, clipboard, and lazy.nvim bootstrap
└── plugins/
    ├── init.lua              Recursively loads plugin specs
    ├── code/                 LSP, completion, formatting, Treesitter, DAP, and AI
    ├── editor/               Editing tools, navigation, sessions, and undo
    ├── tools/                Git integrations and terminal
    └── ui/                   Theme, dashboard, statusline, and visual extras
flake.nix                     Optional Lua development environment
.envrc                        direnv integration via use flake
```

Plugin specs are discovered recursively, so a new Lua spec under `lua/plugins/` is
picked up automatically. Start with [sets.lua](lua/core/sets.lua) for editor options,
[remaps.lua](lua/core/remaps.lua) for general mappings, or an individual plugin file for
its behavior and keys.

Thanks to the Neovim community and the maintainers of all the plugins that make this
config possible.
