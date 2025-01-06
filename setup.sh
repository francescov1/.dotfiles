# Install basic tools used on new macOS

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install tmux
brew install tmux

# Install tmuxinator
brew install tmuxinator

# Install pyenv and pyenv-virtualenv
brew install pyenv
brew install pyenv-virtualenv

brew install fzf
brew install gh
brew install raycast
brew install diff-so-fancy
brew install karabiner-elements

# Speed up key repeats
defaults write NSGlobalDomain KeyRepeat -int 2