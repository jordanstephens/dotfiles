# .'s

## Installation

Clone the repo and run the install script from your home directory

    cd ~
    git clone git@github.com:jordanstephens/dotfiles.git
    cd dotfiles
    ./install.sh

Update plugin submodules

    git submodule update --init

You will want to change your login shell to zsh

    chsh -s /bin/zsh
    
* * *
    
**Important:** Don't forget to update the `[user]` stanza in `.gitconfig` so that your information is reflected rather than mine

    [user]
      name = Your Name
      email = your@email.com

That's all for now
