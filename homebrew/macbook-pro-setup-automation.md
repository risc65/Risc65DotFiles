# Automating a Fresh MacBook Pro Setup

Automating a fresh MacBook Pro setup is a great way to save time. Here's a practical approach using a few proven tools.

## The Standard Stack

**Homebrew + Brewfile** is the foundation. You list every app, CLI tool, font, and Mac App Store app in a single `Brewfile`, then run one command to install everything.

# Install Xcode command line tools

```bash
xcode-select --install
```

```bash
# Install Homebrew first
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then from your Brewfile
brew bundle --file=~/Brewfile
```

A sample `Brewfile`:

```ruby
tap "homebrew/cask-fonts"

# CLI tools
brew "git"
brew "gh"
brew "node"
brew "python@3.12"
brew "ripgrep"
brew "fzf"

# GUI apps
cask "visual-studio-code"
cask "iterm2"
cask "rectangle"
cask "raycast"
cask "1password"

# Fonts
cask "font-jetbrains-mono"

# Mac App Store (requires `mas` and being signed in)
brew "mas"
mas "Xcode", id: 497799835
```

## macOS System Preferences via `defaults`

Most System Settings toggles can be scripted with the `defaults` command. A `macos.sh` script might include things like:

```bash
# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Faster key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Dock auto-hide
defaults write com.apple.dock autohide -bool true

killall Finder Dock
```

Mathias Bynens maintains a famous `.macos` script on GitHub that's worth borrowing from — it has hundreds of these tweaks documented.

## Dotfiles Management

For shell config, git config, editor settings, etc., the common pattern is a `dotfiles` Git repo + symlinks. Tools that help:

- **GNU Stow** — simple symlink manager, very popular
- **chezmoi** — more powerful, handles templating and secrets across machines
- **dotbot** — YAML-based, runs from your repo

## Putting It Together

A typical `bootstrap.sh` runs in this order:

1. Install Xcode Command Line Tools (`xcode-select --install`)
2. Install Homebrew
3. Run `brew bundle`
4. Clone your dotfiles repo
5. Run the symlink step
6. Run your `macos.sh` defaults script

You re-run it on every new machine and it's idempotent.

## Going Further

If you manage multiple Macs (or a fleet), **Ansible** has a Mac-friendly ecosystem — Jeff Geerling's `mac-dev-playbook` on GitHub is the canonical example and is worth looking at even just for ideas. For corporate environments, MDM tools like Jamf or Mosyle handle this at scale.
