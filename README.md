# Dotfiles: SRE & DevOps Environment

A heavily customized, high-performance dotfiles configuration designed for a cross-platform (macOS/Linux) Observability workflow. This repository completely abstracts away the default graphical interface in favor of mathematically perfect tiling, keyboard-driven navigation, and blazing-fast terminal emulators.

---

## 📋 Prerequisites
Before deploying these dotfiles to a fresh macOS system, ensure you have the core package managers installed:

1. **Install Nix:** `curl -L https://nixos.org/nix/install | sh`
2. **Install Homebrew:** `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
3. **Install AeroSpace Manually:** `brew install --cask nikitabobko/tap/aerospace`
   *(AeroSpace is managed via an external brew cask rather than Nix because it requires strict macOS Accessibility API permissions).*

---

## 🚀 Installation & Deployment
Once the prerequisites are met, **do not manually `brew install`** any other tools (like `tmux`, `neovim`, `zoxide`, etc.). The embedded Nix Flake handles downloading, pathing, and optimizing everything automatically.

**1. Build the Nix-Darwin Configuration:**
```bash
# Navigate to the folder containing your Nix flake
cd dotfiles/nix-darwin

# Apply your Nix environment (this installs your shell, terminal, and all SRE dependencies)
# Run activation as root, but use a path: flake reference so sudo does not touch .git
# The extra-experimental-features flag is mandatory the very first time you bootstrap Nix
sudo -H nix run --extra-experimental-features "nix-command flakes" nix-darwin -- switch --flake "path:$PWD#the-unreliable-engineer"
```

**Keep Inputs Fresh Before Rebuilds**
```bash
# Update every pinned input in flake.lock as your user, then apply the new system generation as root
# Do not run flake updates with sudo, or root may end up owning files in .git
cd dotfiles/nix-darwin
nix flake update
sudo -H nix run --extra-experimental-features "nix-command flakes" nix-darwin -- switch --flake "path:$PWD#the-unreliable-engineer"
```

```bash
# If you only want the Codex package to move forward
cd dotfiles/nix-darwin
nix flake update codex-cli-nix
sudo -H nix run --extra-experimental-features "nix-command flakes" nix-darwin -- switch --flake "path:$PWD#the-unreliable-engineer"
```

**2. Deploy Dotfiles via GNU Stow:**
```bash
# Navigate back to the root of your dotfiles repository
cd dotfiles

# Safely symlink all folders directly into ~/.config (powered by your .stowrc rules)
stow .
```

---

## 🛠️ The Technology Stack
Every tool inside these dotfiles has been curated to replace sluggish, unoptimized natively installed system tools.

### Package & Environment Management
- **Nix & nix-darwin**: Declarative OS configuration that handles exactly which system packages are installed.
- **Home Manager**: The user-level configuration engine inside Nix that forces your home directory to remain reproducible.
- **GNU Stow**: Symlink farm manager. Instead of copying files to `~/.config`, stow securely links everything in this repository directly into your system config tree.
- **Direnv**: Minimal environment variable manager. Automatically unloads and loads complex `.env` files dynamically based on which directory you `cd` into.

### The Shell & Terminal
- **Ghostty**: Your GPU-accelerated, blazing-fast terminal emulator.
- **Tmux**: The ultimate terminal multiplexer. Allows you to daemonize terminal sessions so you can safely drop SSH connections, or partition your terminal vertically.
- **Zsh**: The default UNIX shell under the hood.
- **Starship**: The immensely customized, cross-platform terminal prompt written in Rust, natively designed to cleanly display your current Kubernetes Context, Git Branch, and AWS Profile dynamically.
- **Atuin**: Replaces your standard `history` with an encrypted, syncable SQLite database allowing magical, arrow-key based fuzzy searching of any command you've ever typed.

### CLI Modernization (Rust Replacements)
- **Bat**: A modern clone of `cat` with robust syntax highlighting and Git integration.
- **Eza**: A modern replacement for `ls` that provides icons, hyper-fast tree renderings, and raw Git statuses inline.
- **Zoxide**: A smarter `cd` command. It remembers which directories you use most frequently, so you can just type `z project` instead of `cd ~/deep/path/to/project`.
- **fzf** (*and* **fd**): The premier command-line fuzzy finder. Injected into nearly every workflow (like `fv` for fuzzy-finding a file directly into `nvim`).

### macOS-Specific Tiling & UI
*(These tools are macOS only and replace Apple's native WindowManager logic)*
- **AeroSpace**: A strict, i3-inspired Tiling Window Manager. Completely intercepts MacOS window dragging and magically snaps all applications into mathematical, keyboard-navigable grids (bypassing the need for apps like Rectangle).
- **Sketchybar**: A fully programmable status bar that completely covers and replaces the native Apple Mac menu bar. It integrates directly with AeroSpace to display custom workspace indicators.
- **Skhd**: A simple, lightning-fast background daemon that intercepts raw keyboard inputs and translates them into shell scripts or AppleScripts (like clearing your notification center).

### Editor
- **Neovim** (`nvim`): Highly extensible Vim-based text editor mapped flawlessly for rapid YAML generation and editing.
