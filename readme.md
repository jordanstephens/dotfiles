# .'s

## Installation

Clone the repo and run the install script from your home directory

    cd ~
    git clone git@github.com:jordanstephens/dotfiles.git
    cd dotfiles
    ./install.sh

* * *

**Important:** Don't forget to update the `[user]` stanza in `.gitconfig` so that your information is reflected rather than mine

    [user]
      name = Your Name
      email = your@email.com

## Adding Vim Plugins

Use **git submodules** to add new vim plugins.

    git submodule add https://github.com/user/plugin-name.git vim/bundle/plugin-name

