# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Disable autocorrect
unsetopt correct_all

# Aliases

# Basic
alias v="vagrant"
alias ll="ls -lha"

# Git Aliases
alias gs="git status"
alias gc="git commit -v"
alias gca="git commit -av"
alias gcp="git commit --patch"
alias gpush="git push origin master"
alias gpr="git pull --rebase"
alias gch="git checkout"
alias stash="git stash"
alias pop="git stash pop"
alias gpull='gitPullAndFetch'
alias glp="git log --graph --pretty='format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset'"

function gitPullAndFetch {
  git pull $1 $2;
  echo 'Fetching from origin...';
  git fetch;
  echo "Done :)"
}

# If you have custom things to add, create a .zshrc_profile file
# add them to a .zshrc_profile file
if [ -f ~/.zshrc_profile ];
then source ~/.zshrc_profile;
fi
