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
