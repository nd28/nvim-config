# Neovim Configuration Documentation

## Overview
This is my Neovim configuration using built-in features (no plugins) for Neovim v0.12.0.

## Requirements
- Neovim v0.12.0+
- `jq` (for JSON formatting)
- `lazygit` (optional, for full git UI)
- `ripgrep` (for grep search)

## Keybindings

### Leader Key
`<Space>` - Leader key

### Quickfix Navigation
| Keybinding | Action |
|------------|--------|
| `<leader>h` | Next quickfix entry |
| `<leader>;` | Previous quickfix entry |
| `<leader>q` | Close quickfix |
| `<leader>o` | Open quickfix |

### File Search
| Keybinding | Action |
|------------|--------|
| `<leader>ff` | Find file by name (`:find`) |
| `<leader>fg` | Grep in files |
| `<leader>fr` | Find files in current directory |

### JSON Operations
| Keybinding | Action |
|------------|--------|
| `<leader>fj` | Format JSON (using jq) |
| `<leader>jq` | Validate JSON (using jq) |

**Note:** JSON files automatically use TreeSitter for syntax highlighting and folding.

### Git Operations
| Keybinding | Action |
|------------|--------|
| `<leader>gs` | Git status → quickfix (lists modified files) |
| `<leader>lg` | Open LazyGit (terminal UI) |
| `<leader>gd` | Git diff |
| `<leader>gdc` | Git diff (staged) |
| `<leader>gc` | Git commit |
| `<leader>ga` | Git add file |
| `<leader>gl` | Git log (last 10) |

### Navigation
| Keybinding | Action |
|------------|--------|
| `za` | Toggle fold |
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zj` / `zk` | Navigate folds |

### File Operations (netrw)
| Keybinding | Action |
|------------|--------|
| `:e .` | Open file explorer |
| `mt` | Mark folder as copy target |
| `mc` | Copy marked folder to target |
| `:!cp -r <src> <dest>` | Copy folder via shell command |

### Built-in Commands
| Command | Action |
|---------|--------|
| `gf` | Go to file under cursor |
| `gx` | Go to url under cursor |
| `:find <file>` | Find file (supports wildcards) |
| `:grep! <pattern>` | Search in files |

### Buffer/Window
| Keybinding | Action |
|------------|--------|
| `<leader>w` | Save file |
| `<leader>x` | Save & close buffer |

### Search & Replace
| Keybinding | Action |
|------------|--------|
| `/` | Search forward |
| `?` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `<leader>sr` | Search & replace (`:%s/`) |
| `:mksession! session.vim` | Save session |
| `:source session.vim` | Load session |

### Misc
| Keybinding | Action |
|------------|--------|
| `<leader>ev` | Edit config file |

### Window Splits
| Keybinding | Action |
|------------|--------|
| `<leader>sv` | Split vertically |
| `<leader>sh` | Split horizontally |
| `<leader>sc` | Close split |

### Terminal
| Keybinding | Action |
|------------|--------|
| `<leader>tt` | Open terminal |
| `<Ctrl-\\>` | Toggle terminal |
| `Esc` | Exit terminal insert mode |

### Scroll
| Keybinding | Action |
|------------|--------|
| `zt` | Cursor line to top |
| `zb` | Cursor line to bottom |
| `zz` | Cursor line to middle |

### Text Objects
| Keybinding | Action |
|------------|--------|
| `ci"` | Change inside quotes |
| `ca"` | Change including quotes |
| `ci(` | Change inside parentheses |
| `yaw` | Yank around word |

### Marks & Jumps
| Keybinding | Action |
|------------|--------|
| `m<letter>` | Set mark |
| `` `<letter>`` | Jump to mark |
| `<Ctrl-o>` | Go back |
| `<Ctrl-i>` | Go forward |

### Macros
| Keybinding | Action |
|------------|--------|
| `q<letter>` | Record macro |
| `@<letter>` | Play macro |

## Features

### JSON
- TreeSitter syntax highlighting (auto-enabled for `.json` files)
- Folding support
- Format with `<leader>fj` (requires `jq`)
- Validate with `<leader>jq`

### File Search
- Uses built-in `:find` with wildcards (`*`, `**`)
- `ripgrep` integration via `:grep!`
- Results go to quickfix list

### Git
- LazyGit integration (full UI in terminal)
- Git status to quickfix (view modified files and jump)
- Quick git commands without leaving nvim

## Configuration Files

```
~/.config/nvim/
├── init.lua    # Main configuration
└── README.md   # This file
```

## Notes

- No plugin manager required - uses only built-in Neovim features
- Works with Neovim v0.12.0+ (TreeSitter built-in)
- All terminal commands use external tools (jq, ripgrep, lazygit, git)
