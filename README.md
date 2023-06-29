# dotfiles
My personal dotfiles repo

## Dependency Installations

```sh
# Install Homebrew
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Brew install Chezmoi & neovim & tmux & nvm & goenv
$ brew install chezmoi neovim tmux nvm goenv

# Generate ssh-key pairs
$ ssh-keygen -t rsa -b 4096

# Install Oh My Zsh and it's plugins
$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
$ git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache
$ git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm

# Install Tmux plugin manager
# Need to init plugins after tmux into a new session. And Keyboard <Ctrl+F> -> Shift + I
$ git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Install AstroNvim
$ git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# Init Chezmoi
$ chezmoi init
$ chezmoi cd && git remote add origin git@github.com:daiyanze/dotfiles.git && git rebase --onto origin/main
$ chezmoi apply
$ cd -
```

