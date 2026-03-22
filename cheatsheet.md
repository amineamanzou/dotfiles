# System Shortcut & Cheatsheet

Here is your consolidated reference guide for navigating your window manager, terminal, and shell via the custom bindings defined in this repository.

---

## 🪟 AeroSpace (Window Tiling)

*These bindings force your current application windows into grids or floating layers. All default AeroSpace bindings start with the `alt` key.*

### Core Layouts & Resizing

| Shortcut | Action |
| --- | --- |
| `alt+ctrl+shift+f` | Fullscreen the currently focused window |
| `alt+ctrl+f` | Toggle the window between floating (free-form) and tiling (grid) |
| `alt+shift+h/j/k/l` | Move (throw) window left, down, up, or right |
| `alt+h/j/k/l` | Focus the window left, down, up, or right |
| `alt+slash` | Switch layout grouping to Tiles (horizontal/vertical partitions) |
| `alt+comma` | Switch layout grouping to Accordion (stacked tabs) |
| `alt+shift+minus/equal`| Resize the focused window (-50 or +50 pixels) |

### Workspaces & Monitors

| Shortcut | Action |
| --- | --- |
| `alt+1/2/3/4` | Switch focus instantly to Workspace 1, 2, 3, or 4 |
| `alt+shift+1/2/3/4` | Move the active window to Workspace 1, 2, 3, or 4 (follows window) |
| `alt+tab` | Toggle between your two most recent workspaces |
| `alt+shift+tab` | Move the entire workspace to your next physical monitor |

### Instant App Launchers (from AeroSpace)

| Shortcut | Application Launched |
| --- | --- |
| `alt+w` | Ghostty Terminal |
| `alt+o` | Obsidian Notes |
| `alt+b` | Brain.fm |
| `alt+s` | Slack |
| `alt+f` | macOS Finder |
| `alt+e` | Final Cut Pro |
| `alt+z` | Zen Browser |

---

## ⌨️ Skhd (Global macOS Hotkeys)

*These execute background shell commands regardless of what app is currently in focus.*

| Shortcut | Action |
| --- | --- |
| `alt+s` | Launch Safari |
| `alt+o` | Launch Obsidian (Override) |
| `alt+q` | Launch QuickTime Player |
| `alt+f` | Launch Final Cut Pro (Override) |
| `alt+g` | Launch Ghostty Terminal |
| `right_alt+n` | Clears and closes all banners in Apple Notification Center |

---

## 🖥️ Tmux (Terminal Multiplexer)

*Your Tmux configuration is bound to the `Ctrl+A` prefix.*

| Shortcut | Action |
| --- | --- |
| `Prefix + p` | Toggle **Floax** (A floating, transparent overlay terminal pane) |
| `Prefix + o` | Open **SessionX** (A powerful Zoxide/FZF-based session manager to jump directories) |
| `Prefix + ctrl-y`| In SessionX: Create a completely new tmux window, and zoom it instantly |

---

## 🐚 Zsh & CLI Navigations

*Custom aliases and modern tool replacements configured in `.zshrc`.*

### Modern File Navigation

| Command | Original | What it does |
| --- | --- | --- |
| `cat` | `cat` -> `bat` | Outputs files with full color-coded syntax highlighting |
| `l`, `lt` | `ls` -> `eza`| Modern colorful `ls` that shows Git statuses and icons |
| `z [dir]`| `cd` -> `zoxide`| Jumps to a directory dynamically based on frequency (e.g. `z dot` -> `cd ~/Projects/dotfiles`) |

### FZF Helpers

| Command | Action |
| --- | --- |
| `cx [dir]`| Change to directory and immediately print contents (`eza`) |
| `fcd` | Interactively fuzzy-find a directory natively, and jump to it |
| `f` | Interactively fuzzy-find a file, and copy its absolute path to your clipboard |
| `fv` | Interactively fuzzy-find a file, and immediately edit it in `nvim` |

### Cloud & Kubernetes (SRE Tools)

| Alias | Expanded Command |
| --- | --- |
| `k` | `kubectl` |
| `kg` / `kd` / `kdel`| `kubectl get` / `kubectl describe` / `kubectl delete` |
| `kl` | `kubectl logs` |
| `kgpo` / `kgd` | `kubectl get pods` / `kubectl get deployments` |
| `kc` | `kubectx` (Change clusters) |
| `kcm` | `kubecm` (Manage kubeconfigs) |
| `kns` | `kubens` (Change active namespace) |
| `ke` | `kubectl exec -it` |

---

## 📝 Neovim (LazyVim)

*This configuration is powered by LazyVim. By default, your `<leader>` key is **`Space`**.*

### General overrides

| Shortcut | Mode | Action |
| --- | --- | --- |
| `jj` or `jk` | Insert | Escape back to Normal mode |

### 🤖 OpenCode (LLM Integration plugin)

| Shortcut | Action |
| --- | --- |
| `<leader>ot` | Toggle embedded OpenCode view |
| `<leader>oa` | Ask about the current line or selection |
| `<leader>o+` | Add the entire buffer or current selection to the prompt |
| `<leader>oe` | Explain this code |
| `<leader>on` | Start a new OpenCode session |
| `<leader>os` | Select prompt |
| `<Shift+Ctrl+u>` | Messages half page up |
| `<Shift+Ctrl+d>` | Messages half page down |

### 🛠️ Example Plugin (Typescript utilities)

| Shortcut | Action |
| --- | --- |
| `<leader>co` | Organize Imports |
| `<leader>cR` | Rename File |
