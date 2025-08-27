# dotfiles
My personal dotfiles configurations managed with GNU Stow

## What's Included

- **zsh** - Zsh configuration with Oh My Zsh, autocompletion plugins
- **nvim** - Neovim configuration  
- **starship** - Cross-shell prompt configuration
- **git** - Git configuration and aliases

## Setup on New Machine

1. **Install prerequisites:**
   ```bash
   # Install GNU Stow
   brew install stow
   
   # Install Oh My Zsh (if not already installed)
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

2. **Clone and deploy dotfiles:**
   ```bash
   git clone <your-repo-url> ~/Dev/Personal/dotfiles
   cd ~/Dev/Personal/dotfiles
   stow -t ~ nvim starship zsh git
   ```

3. **Install zsh plugins (if needed):**
   ```bash
   # zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   
   # zsh-syntax-highlighting  
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   
   # Install fzf
   brew install fzf
   $(brew --prefix)/opt/fzf/install
   ```

## Daily Usage

**Making changes:**
```bash
cd ~/Dev/Personal/dotfiles
# Edit files directly in the repo
git add . && git commit -m "Update configs"
git push
```

**Adding new configs:**
```bash
# Example: Add tmux config
mkdir -p tmux
cp ~/.tmux.conf tmux/
stow -t ~ tmux
```

## Management Commands

**Deploy all configs:**
```bash
cd ~/Dev/Personal/dotfiles  
stow -t ~ nvim starship zsh git
```

**Remove symlinks:**
```bash
cd ~/Dev/Personal/dotfiles
stow -D -t ~ nvim starship zsh git
```

**Restow (useful after adding files):**
```bash
cd ~/Dev/Personal/dotfiles
stow -R -t ~ nvim starship zsh git
```
