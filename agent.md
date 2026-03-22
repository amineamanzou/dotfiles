# Agent Context: Dotfiles & Interactive Learning Platform

## Context
This repo shares a dotfiles environment. The workstation is heavily optimized for an SRE workflow using macOS, Nix-Darwin, AeroSpace, Tmux, and Neovim (LazyVim + OpenCode). 

The primary objective of this repository is to build an interactive, web-based "serious game" to help others easily install this environment and interactively learn its complex keyboard shortcuts.

## Goals
1. **Interactive Serious Game**: Develop a static web application that acts as a gamified bootcamp or tutorial for the dotfiles ecosystem.
2. **Persistent Achievement Tracking**: Implement `localStorage` tightly in the browser to track users' progress as they safely complete different "levels" or scenarios (e.g., mastering AeroSpace window tiling, Tmux multiplexing, and Neovim AI workflows) without requiring a backend database.
3. **Frictionless Onboarding**: Provide clear, copy-paste onboarding instructions for new users to cleanly bootstrap the dotfiles via Nix and Stow before starting the game.

## Technologies & Target Stack
- **Hosting**: GitHub Pages (Strictly Static HTML/CSS/JS or a lightweight static site generator).
- **State Management**: Browser `localStorage` for saving achievements, unlocked levels, and configuration state.
- **Syllabus**: The game strictly teaches the SRE tools configured in this repo: AeroSpace, Ghostty, Tmux (SessionX/Floax), FZF, Zoxide, LazyVim, and OpenCode integrations.

## Agent Guidelines
- When developing the website, ensure it remains entirely static and frontend-only to maintain GitHub Pages compatibility. No NodeJS backends or API servers.
- Design the game logic to be modular so new shortcuts and tools (new "Levels") can be effortlessly added.
- The core `.zshrc`, `flake.nix`, and `.tmux.conf` are stable. The focus of future agent work is strictly on the educational web wrapper and game development.
